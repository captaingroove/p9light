#include <u.h>
#include <libc.h>
#include <fcall.h>
#include <thread.h>
#include <9p.h>


void
fsread(Req *r)
{
	readstr(r, "Hello from 9P!\n");
	respond(r, nil);
}


Srv fs = {
	.read = fsread,
};


void
threadmain(int argc, char** argv)
{
	chatty9p = 1;
	Tree *tree;
	tree = alloctree(nil, nil, DMDIR|0555, nil);
	fs.tree = tree;
	createfile(tree->root, "hello", nil, 0444, nil);
	fs.foreground = 1;
	threadpostmountsrv(&fs, "hellosrv", nil, MREPL | MCREATE);
}
