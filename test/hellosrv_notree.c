#include <u.h>
#include <libc.h>
#include <fcall.h>
#include <thread.h>
#include <9p.h>

#define QTYPE(p) ((p) & 0xF)

// Based on /home/jorg/devel/plan9/plan9fusr/src/cmd/fontsrv/main.c

static char *hellosrvname = "hellosrv";
static char *hellofname = "hello";
static char *hellouname = "hello";
static char *hellogname = "hello";
static char *hellostr = "Hello from 9P!\n";

enum
{
	Qroot = 0,
	Qhellofile,
};


static void
dostat(vlong path, Qid *qid, Dir *dir)
{
	char *name;
	Qid q;
	ulong mode;
	vlong length;

	q.type = 0;
	q.vers = 0;
	q.path = path;
	mode = 0444;
	length = 0;
	name = "???";

	switch(QTYPE(path)) {
	default:
		sysfatal("dostat %#llux", path);

	case Qroot:
		q.type = QTDIR;
		name = "/";
		break;

	case Qhellofile:
		q.type = QTFILE;
		name = hellofname;
		length = strlen(hellostr);
		break;
	}

	if(qid)
		*qid = q;
	if(dir) {
		memset(dir, 0, sizeof *dir);
		dir->name = estrdup9p(name);
		dir->muid = estrdup9p("");
		dir->uid  = estrdup9p(hellouname);
		dir->gid  = estrdup9p(hellogname);
		dir->qid  = q;
		if(q.type == QTDIR)
			mode |= DMDIR | 0111;
		dir->mode = mode;
		dir->length = length;
	}
}


// FIXME "/" is an entry in the root directory
static int
rootgen(int i, Dir *d, void *v)
{
	if(i >= 2)
		// End of directory
		return -1;
	dostat(QTDIR | i, nil, d);
	return 0;
}


static void
srvattach(Req *r)
{
	/* dostat(0, &r->ofcall.qid, nil); */
	// Maybe more explicitly writing the path of the root dir ...
	dostat(QTDIR | Qroot, &r->ofcall.qid, nil);
	r->fid->qid = r->ofcall.qid;
	respond(r, nil);
}


// walk() doesn't work this way ... so we use walk1() below.
/*
void
srvwalk(Req *r)
{
	if (r->ifcall.nwname > 0) {
		// not root, check for file name r->ifcall.wname
		// in our simple case we have only one file in root
		r->ofcall.qid.type = QTFILE;
		r->ofcall.qid.vers = 0;
		r->ofcall.qid.path = QTFILE | Qhellofile;
		// ofcall.nqid is mentioned in 9p(3), but doesn't exist
		// r->ofcall.nqid = 0;
	}
	else {
		r->ofcall.qid.type = QTDIR;
		r->ofcall.qid.vers = 0;
		r->ofcall.qid.path = 0;
	}
	respond(r, nil);
}
*/


static char*
srvwalk1(Fid *fid, char *name, Qid *qid)
{
	int i, dotdot;
	vlong path;

	path = fid->qid.path;
	dotdot = strcmp(name, "..") == 0;
	
	switch(QTYPE(path)) {
	default:
	NotFound:
		return "file not found";

	case Qroot:
		if(dotdot)
			break;
		for(i=0; i<2; i++) {
			if(strcmp(hellofname, name) == 0) {
				path = QTFILE | Qhellofile;
				goto Found;
			}
		}
		goto NotFound;
	}

Found:
	dostat(path, qid, nil);
	fid->qid = *qid;
	return nil;
}


void
srvstat(Req *r)
{
	dostat(r->fid->qid.path, nil, &r->d);
	respond(r, nil);
}


void
srvopen(Req *r)
{
	r->ofcall.qid = r->fid->qid;
	respond(r, nil);
}


void
srvread(Req *r)
{
	vlong path;

	path = r->fid->qid.path;
	switch(QTYPE(path)) {
	case Qroot:
		dirread9p(r, rootgen, nil);
		break;
	case Qhellofile:
		readstr(r, hellostr);
		break;
	}
	respond(r, nil);
}


Srv server = {
	.attach = srvattach,
	/* .walk   = srvwalk, */
	.walk1  = srvwalk1,
	.stat   = srvstat,
	.open   = srvopen,
	.read   = srvread,
};


void
threadmain(int argc, char** argv)
{
	chatty9p = 1;
	server.foreground = 1;
	threadpostmountsrv(&server, hellosrvname, nil, MREPL | MCREATE);
}
