#include <u.h>
#include <stdio.h>
#include <libc.h>
#include <thread.h>

#include "log.h"

/////////////////////////////////////////////////////////////////////////////////////
// For other libthread examples supplied by plan9port, see:
// $HOME/devel/plan9/plan9fusr/src/libthread/test
/////////////////////////////////////////////////////////////////////////////////////


#define THREAD_STACK_SIZE 1024 * 8
int (*mk)(void (*fn)(void*), void *arg, uint stack);

/// Set some parameters here ...
/// Switch between threads and procs
// #define USEPROC
/// Switch between yield & sleep and receivp() on an "empty channel"
/// The correct way is not defining YIELDNSLEEP
// #define YIELDNSLEEP 
/// Length of channel queue
#define QLEN        (0)


static struct ctx
{
	int t1id, t2id;
	Channel *c;
	int smsecs;
} ctx;


void
t1(void *data)
{
	struct ctx *ctx = data;
	LOG("t1 started with id: %d", ctx->t1id);
	for (uint i = 69;;i++) {
	// for (uint i = 0; i < 1;i++) {
		sendul(ctx->c, i);
		LOG("t1, id: %d send %d", ctx->t1id, i);
		// yield();
		sleep(ctx->smsecs);
	}
}


void
t2(void *data)
{
	struct ctx *ctx = data;
	LOG("t2 started with id: %d", ctx->t2id);
	uint i;
	for (;;) {
		i = recvul(ctx->c);
		LOG("t2, id: %d recv %d", ctx->t2id, i);
		// yield();
		sleep(ctx->smsecs);
	}
}


void
threadmain(int argc, char *argv[])
{
#ifndef USEPROC
	mk = threadcreate;
#else
	mk = proccreate;
#endif
	int qlen = QLEN;
	ctx.smsecs = 50;
	ctx.c = chancreate(sizeof(ulong), qlen);
	ctx.t1id = mk(t1, &ctx, THREAD_STACK_SIZE);
	ctx.t2id = mk(t2, &ctx, THREAD_STACK_SIZE);
	/// THIS MAKES THE DIFFERENCE
	/// Using recvp on a new channel makes the whole machinery run
	/// even if using procs instead of threads
#ifdef YIELDNSLEEP
	yield();
	sleep(3* 1000);
#else
	recvp(chancreate(sizeof(void*), 0));
#endif
	threadexitsall("exiting");
}
