B = build
O = o
S = src
CPPFLAGS = -Iinclude
CFLAGS = -fPIC -O2
LDFLAGS = -shared
POSIXLIBS = -lpthread -lm -lz
PREFIX = /usr/local
INSTINC = $(DESTDIR)$(PREFIX)/include/9p
INSTLIB = $(DESTDIR)$(PREFIX)/lib
INSTBIN = $(DESTDIR)$(PREFIX)/bin

all: \
  $(B) \
  $(B)/libip.so \
  $(B)/libmp.so \
  $(B)/libmux.so \
  $(B)/libndb.so \
  $(B)/libbio.so \
  $(B)/libregexp.so \
  $(B)/libthread.so \
  $(B)/libsec.so \
  $(B)/libauthsrv.so \
  $(B)/libauth.so \
  $(B)/lib9.so \
  $(B)/lib9p.so \
  $(B)/lib9pclient.so \
  $(B)/9p

$(B):
	mkdir $(B)

install:
	install -D -t $(INSTINC) include/*.h
	install -D -t $(INSTLIB) $(B)/*.so
	install -D -t $(INSTBIN) $(B)/9p

clean:
	rm -f $$(find -name '*.'$(O))
	rm -rf $(B)

OBJ_9 = \
  src/lib9/_exits.$(O) \
  src/lib9/_p9dialparse.$(O) \
  src/lib9/_p9dir.$(O) \
  src/lib9/announce.$(O) \
  src/lib9/argv0.$(O) \
  src/lib9/atexit.$(O) \
  src/lib9/atoi.$(O) \
  src/lib9/atol.$(O) \
  src/lib9/atoll.$(O) \
  src/lib9/atnotify.$(O) \
  src/lib9/await.$(O) \
  src/lib9/cistrcmp.$(O) \
  src/lib9/cistrncmp.$(O) \
  src/lib9/cistrstr.$(O) \
  src/lib9/cleanname.$(O) \
  src/lib9/convD2M.$(O) \
  src/lib9/convM2D.$(O) \
  src/lib9/convM2S.$(O) \
  src/lib9/convS2M.$(O) \
  src/lib9/crypt.$(O) \
  src/lib9/ctime.$(O) \
  src/lib9/dial.$(O) \
  src/lib9/dirfstat.$(O) \
  src/lib9/dirfwstat.$(O) \
  src/lib9/dirmodefmt.$(O) \
  src/lib9/dirstat.$(O) \
  src/lib9/dirwstat.$(O) \
  src/lib9/dup.$(O) \
  src/lib9/encodefmt.$(O) \
  src/lib9/errstr.$(O) \
  src/lib9/exec.$(O) \
  src/lib9/execl.$(O) \
  src/lib9/exitcode.$(O) \
  src/lib9/fcallfmt.$(O) \
  src/lib9/frand.$(O) \
  src/lib9/get9root.$(O) \
  src/lib9/getcallerpc.$(O) \
  src/lib9/getenv.$(O) \
  src/lib9/getfields.$(O) \
  src/lib9/getnetconn.$(O) \
  src/lib9/getns.$(O) \
  src/lib9/getuser.$(O) \
  src/lib9/getwd.$(O) \
  src/lib9/jmp.$(O) \
  src/lib9/lrand.$(O) \
  src/lib9/lnrand.$(O) \
  src/lib9/main.$(O) \
  src/lib9/malloc.$(O) \
  src/lib9/malloctag.$(O) \
  src/lib9/mallocz.$(O) \
  src/lib9/nan.$(O) \
  src/lib9/needsrcquote.$(O) \
  src/lib9/needstack.$(O) \
  src/lib9/netcrypt.$(O) \
  src/lib9/netmkaddr.$(O) \
  src/lib9/notify.$(O) \
  src/lib9/nrand.$(O) \
  src/lib9/nulldir.$(O) \
  src/lib9/open.$(O) \
  src/lib9/opentemp.$(O) \
  src/lib9/pin.$(O) \
  src/lib9/pipe.$(O) \
  src/lib9/post9p.$(O) \
  src/lib9/postnote.$(O) \
  src/lib9/qlock.$(O) \
  src/lib9/quote.$(O) \
  src/lib9/rand.$(O) \
  src/lib9/read9pmsg.$(O) \
  src/lib9/readcons.$(O) \
  src/lib9/readn.$(O) \
  src/lib9/rfork.$(O) \
  src/lib9/searchpath.$(O) \
  src/lib9/sendfd.$(O) \
  src/lib9/sleep.$(O) \
  src/lib9/strdup.$(O) \
  src/lib9/strecpy.$(O) \
  src/lib9/sysfatal.$(O) \
  src/lib9/syslog.$(O) \
  src/lib9/sysname.$(O) \
  src/lib9/time.$(O) \
  src/lib9/tm2sec.$(O) \
  src/lib9/tokenize.$(O) \
  src/lib9/truerand.$(O) \
  src/lib9/u16.$(O) \
  src/lib9/u32.$(O) \
  src/lib9/u64.$(O) \
  src/lib9/unsharp.$(O) \
  src/lib9/wait.$(O) \
  src/lib9/waitpid.$(O) \
  src/lib9/write.$(O) \
  src/lib9/zoneinfo.$(O) \
  src/lib9/fmt/dofmt.$(O) \
  src/lib9/fmt/fltfmt.$(O) \
  src/lib9/fmt/fmt.$(O) \
  src/lib9/fmt/fmtfd.$(O) \
  src/lib9/fmt/fmtfdflush.$(O) \
  src/lib9/fmt/fmtlocale.$(O) \
  src/lib9/fmtlock2.$(O) \
  src/lib9/fmt/fmtnull.$(O) \
  src/lib9/fmt/fmtprint.$(O) \
  src/lib9/fmt/fmtquote.$(O) \
  src/lib9/fmt/fmtrune.$(O) \
  src/lib9/fmt/fmtstr.$(O) \
  src/lib9/fmt/fmtvprint.$(O) \
  src/lib9/fmt/fprint.$(O) \
  src/lib9/frexp.$(O) \
  src/lib9/fmt/nan64.$(O) \
  src/lib9/fmt/print.$(O) \
  src/lib9/fmt/runefmtstr.$(O) \
  src/lib9/fmt/runeseprint.$(O) \
  src/lib9/fmt/runesmprint.$(O) \
  src/lib9/fmt/runesnprint.$(O) \
  src/lib9/fmt/runesprint.$(O) \
  src/lib9/fmt/runevseprint.$(O) \
  src/lib9/fmt/runevsmprint.$(O) \
  src/lib9/fmt/runevsnprint.$(O) \
  src/lib9/fmt/seprint.$(O) \
  src/lib9/fmt/smprint.$(O) \
  src/lib9/fmt/snprint.$(O) \
  src/lib9/fmt/sprint.$(O) \
  src/lib9/fmt/strtod.$(O) \
  src/lib9/fmt/vfprint.$(O) \
  src/lib9/fmt/vseprint.$(O) \
  src/lib9/fmt/vsmprint.$(O) \
  src/lib9/fmt/vsnprint.$(O) \
  src/lib9/fmt/charstod.$(O) \
  src/lib9/fmt/pow10.$(O) \
  src/lib9/utf/rune.$(O) \
  src/lib9/utf/runestrcat.$(O) \
  src/lib9/utf/runestrchr.$(O) \
  src/lib9/utf/runestrcmp.$(O) \
  src/lib9/utf/runestrcpy.$(O) \
  src/lib9/utf/runestrdup.$(O) \
  src/lib9/utf/runestrlen.$(O) \
  src/lib9/utf/runestrecpy.$(O) \
  src/lib9/utf/runestrncat.$(O) \
  src/lib9/utf/runestrncmp.$(O) \
  src/lib9/utf/runestrncpy.$(O) \
  src/lib9/utf/runestrrchr.$(O) \
  src/lib9/utf/runestrstr.$(O) \
  src/lib9/utf/runetype.$(O) \
  src/lib9/utf/utfecpy.$(O) \
  src/lib9/utf/utflen.$(O) \
  src/lib9/utf/utfnlen.$(O) \
  src/lib9/utf/utfrrune.$(O) \
  src/lib9/utf/utfrune.$(O) \
  src/lib9/utf/utfutf.$(O)

$(B)/lib9.so: $(OBJ_9)
	$(CC) -o $@ $(LDFLAGS) $^ -lauth $(POSIXLIBS)

OBJ_BIO = \
  src/libbio/bbuffered.$(O) \
  src/libbio/bfildes.$(O) \
  src/libbio/bflush.$(O) \
  src/libbio/bgetc.$(O) \
  src/libbio/bgetrune.$(O) \
  src/libbio/bgetd.$(O) \
  src/libbio/binit.$(O) \
  src/libbio/boffset.$(O) \
  src/libbio/bprint.$(O) \
  src/libbio/bputc.$(O) \
  src/libbio/bputrune.$(O) \
  src/libbio/brdline.$(O) \
  src/libbio/brdstr.$(O) \
  src/libbio/bread.$(O) \
  src/libbio/bseek.$(O) \
  src/libbio/bvprint.$(O) \
  src/libbio/bwrite.$(O)

$(B)/libbio.so: $(OBJ_BIO)
	$(CC) -o $@ $(LDFLAGS) $^ $(POSIXLIBS)

OBJ_REGEXP = \
  src/libregexp/regcomp.$(O) \
  src/libregexp/regerror.$(O) \
  src/libregexp/regexec.$(O) \
  src/libregexp/regsub.$(O) \
  src/libregexp/regaux.$(O) \
  src/libregexp/rregexec.$(O) \
  src/libregexp/rregsub.$(O)

$(B)/libregexp.so: $(OBJ_REGEXP)
	$(CC) -o $@ $(LDFLAGS) $^ $(POSIXLIBS)

OBJ_THREAD = \
  src/libthread/bg.$(O) \
  src/libthread/channel.$(O) \
  src/libthread/daemonize.$(O) \
  src/libthread/exec.$(O) \
  src/libthread/ioproc.$(O) \
  src/libthread/iorw.$(O) \
  src/libthread/pthread.$(O) \
  src/libthread/ref.$(O) \
  src/libthread/thread.$(O) \
  src/libthread/wait.$(O)

$(B)/libthread.so: $(OBJ_THREAD)
	$(CC) -o $@ $(LDFLAGS) $^ $(POSIXLIBS)

OBJ_9P = \
  src/lib9p/dirread.$(O) \
  src/lib9p/fid.$(O) \
  src/lib9p/file.$(O) \
  src/lib9p/intmap.$(O) \
  src/lib9p/mem.$(O) \
  src/lib9p/parse.$(O) \
  src/lib9p/req.$(O) \
  src/lib9p/srv.$(O) \
  src/lib9p/tpost.$(O) \
  src/lib9p/uid.$(O) \
  src/lib9p/util.$(O)
# src/lib9p/ftest.c   ## Just a test program with a main() entry point
# src/lib9p/ramfs.c   ## Just a test program with a main() entry point

$(B)/lib9p.so: $(OBJ_9P)
	$(CC) -o $@ $(LDFLAGS) $^ $(POSIXLIBS)

OBJ_9PCLIENT = \
  src/lib9pclient/access.$(O) \
  src/lib9pclient/auth.$(O) \
  src/lib9pclient/close.$(O) \
  src/lib9pclient/create.$(O) \
  src/lib9pclient/dirread.$(O) \
  src/lib9pclient/fs.$(O) \
  src/lib9pclient/ns.$(O) \
  src/lib9pclient/open.$(O) \
  src/lib9pclient/openfd.$(O) \
  src/lib9pclient/print.$(O) \
  src/lib9pclient/read.$(O) \
  src/lib9pclient/remove.$(O) \
  src/lib9pclient/seek.$(O) \
  src/lib9pclient/stat.$(O) \
  src/lib9pclient/walk.$(O) \
  src/lib9pclient/write.$(O) \
  src/lib9pclient/wstat.$(O)

$(B)/lib9pclient.so: $(OBJ_9PCLIENT)
	$(CC) -o $@ $(LDFLAGS) $^ -lmux $(POSIXLIBS)

OBJ_MP = \
  src/libmp/port/betomp.$(O) \
  src/libmp/port/crt.$(O) \
  src/libmp/port/letomp.$(O) \
  src/libmp/port/mpadd.$(O) \
  src/libmp/port/mpaux.$(O) \
  src/libmp/port/mpcmp.$(O) \
  src/libmp/port/mpdigdiv.$(O) \
  src/libmp/port/mpdiv.$(O) \
  src/libmp/port/mpeuclid.$(O) \
  src/libmp/port/mpexp.$(O) \
  src/libmp/port/mpextendedgcd.$(O) \
  src/libmp/port/mpfactorial.$(O) \
  src/libmp/port/mpfmt.$(O) \
  src/libmp/port/mpinvert.$(O) \
  src/libmp/port/mpleft.$(O) \
  src/libmp/port/mpmod.$(O) \
  src/libmp/port/mpmul.$(O) \
  src/libmp/port/mprand.$(O) \
  src/libmp/port/mpright.$(O) \
  src/libmp/port/mpsub.$(O) \
  src/libmp/port/mptobe.$(O) \
  src/libmp/port/mptoi.$(O) \
  src/libmp/port/mptole.$(O) \
  src/libmp/port/mptoui.$(O) \
  src/libmp/port/mptouv.$(O) \
  src/libmp/port/mptov.$(O) \
  src/libmp/port/mpvecadd.$(O) \
  src/libmp/port/mpveccmp.$(O) \
  src/libmp/port/mpvecdigmuladd.$(O) \
  src/libmp/port/mpvecsub.$(O) \
  src/libmp/port/strtomp.$(O)
# src/libmp/port/crttest.c

$(B)/libmp.so: $(OBJ_MP)
	$(CC) -o $@ $(LDFLAGS) $^ $(POSIXLIBS)

OBJ_SEC = \
  src/libsec/port/aes.$(O) \
  src/libsec/port/blowfish.$(O) \
  src/libsec/port/decodepem.$(O) \
  src/libsec/port/des3CBC.$(O) \
  src/libsec/port/des3ECB.$(O) \
  src/libsec/port/des.$(O) \
  src/libsec/port/desCBC.$(O) \
  src/libsec/port/desECB.$(O) \
  src/libsec/port/desmodes.$(O) \
  src/libsec/port/dsaalloc.$(O) \
  src/libsec/port/dsagen.$(O) \
  src/libsec/port/dsaprimes.$(O) \
  src/libsec/port/dsaprivtopub.$(O) \
  src/libsec/port/dsasign.$(O) \
  src/libsec/port/dsaverify.$(O) \
  src/libsec/port/egalloc.$(O) \
  src/libsec/port/egdecrypt.$(O) \
  src/libsec/port/egencrypt.$(O) \
  src/libsec/port/eggen.$(O) \
  src/libsec/port/egprivtopub.$(O) \
  src/libsec/port/egsign.$(O) \
  src/libsec/port/egverify.$(O) \
  src/libsec/port/fastrand.$(O) \
  src/libsec/port/genprime.$(O) \
  src/libsec/port/genrandom.$(O) \
  src/libsec/port/gensafeprime.$(O) \
  src/libsec/port/genstrongprime.$(O) \
  src/libsec/port/hmac.$(O) \
  src/libsec/port/md4.$(O) \
  src/libsec/port/md5block.$(O) \
  src/libsec/port/md5.$(O) \
  src/libsec/port/md5pickle.$(O) \
  src/libsec/port/nfastrand.$(O) \
  src/libsec/port/prng.$(O) \
  src/libsec/port/probably_prime.$(O) \
  src/libsec/port/rc4.$(O) \
  src/libsec/port/readcert.$(O) \
  src/libsec/port/rsaalloc.$(O) \
  src/libsec/port/rsadecrypt.$(O) \
  src/libsec/port/rsaencrypt.$(O) \
  src/libsec/port/rsafill.$(O) \
  src/libsec/port/rsagen.$(O) \
  src/libsec/port/rsaprivtopub.$(O) \
  src/libsec/port/sha1block.$(O) \
  src/libsec/port/sha1.$(O) \
  src/libsec/port/sha1pickle.$(O) \
  src/libsec/port/smallprimes.$(O) \
  src/libsec/port/smallprimetest.$(O) \
  src/libsec/port/thumb.$(O) \
  src/libsec/port/tlshand.$(O) \
  src/libsec/port/x509.$(O)
  # src/libsec/port/egtest.c
  # src/libsec/port/hmactest.c
  # src/libsec/port/md4test.c
  # src/libsec/port/primetest.c
  # src/libsec/port/rsatest.c

$(B)/libsec.so: $(OBJ_SEC)
	$(CC) -o $@ $(LDFLAGS) $^ -lauth -lmp $(POSIXLIBS)

OBJ_AUTHSRV = \
  src/libauthsrv/_asgetticket.$(O) \
  src/libauthsrv/_asrdresp.$(O) \
  src/libauthsrv/authdial.$(O) \
  src/libauthsrv/convA2M.$(O) \
  src/libauthsrv/convM2A.$(O) \
  src/libauthsrv/convM2PR.$(O) \
  src/libauthsrv/convM2T.$(O) \
  src/libauthsrv/convM2TR.$(O) \
  src/libauthsrv/convPR2M.$(O) \
  src/libauthsrv/convT2M.$(O) \
  src/libauthsrv/convTR2M.$(O) \
  src/libauthsrv/nvcsum.$(O) \
  src/libauthsrv/opasstokey.$(O) \
  src/libauthsrv/passtokey.$(O) \
  src/libauthsrv/readnvram.$(O)

$(B)/libauthsrv.so: $(OBJ_AUTHSRV)
	$(CC) -o $@ $(LDFLAGS) $^ -lndb -lbio $(POSIXLIBS)

OBJ_AUTH = \
  src/libauth/amount_getkey.$(O) \
  src/libauth/attr.$(O) \
  src/libauth/auth_attr.$(O) \
  src/libauth/auth_challenge.$(O) \
  src/libauth/auth_getkey.$(O) \
  src/libauth/auth_getuserpasswd.$(O) \
  src/libauth/auth_proxy.$(O) \
  src/libauth/auth_respond.$(O) \
  src/libauth/auth_rpc.$(O) \
  src/libauth/auth_userpasswd.$(O) \
  src/libauth/fsamount.$(O) \
  src/libauth/nsamount.$(O)
#  src/libauth/amount.c
#  src/libauth/auth_chuid.c
#  src/libauth/auth_wep.c
#  src/libauth/login.c
#  src/libauth/newns.c
#  src/libauth/noworld.c

$(B)/libauth.so: $(OBJ_AUTH)
	$(CC) -o $@ $(LDFLAGS) $^ -l9pclient -lbio -lauthsrv $(POSIXLIBS)

OBJ_NDB = \
  src/libndb/ipattr.$(O) \
  src/libndb/ndbaux.$(O) \
  src/libndb/ndbcache.$(O) \
  src/libndb/ndbcat.$(O) \
  src/libndb/ndbconcatenate.$(O) \
  src/libndb/ndbdiscard.$(O) \
  src/libndb/ndbfree.$(O) \
  src/libndb/ndbgetipaddr.$(O) \
  src/libndb/ndbgetval.$(O) \
  src/libndb/ndbhash.$(O) \
  src/libndb/ndbipinfo.$(O) \
  src/libndb/ndblookval.$(O) \
  src/libndb/ndbopen.$(O) \
  src/libndb/ndbparse.$(O) \
  src/libndb/ndbreorder.$(O) \
  src/libndb/ndbsubstitute.$(O) \
  src/libndb/sysdnsquery.$(O)
#  src/libndb/csgetval.c
#  src/libndb/csipinfo.c
#  src/libndb/dnsquery.c

$(B)/libndb.so: $(OBJ_NDB)
	$(CC) -o $@ $(LDFLAGS) $^ -lip $(POSIXLIBS)

OBJ_IP = \
  src/libip/bo.$(O) \
  src/libip/classmask.$(O) \
  src/libip/eipfmt.$(O) \
  src/libip/equivip.$(O) \
  src/libip/freeipifc.$(O) \
  src/libip/ipaux.$(O) \
  src/libip/Linux.$(O) \
  src/libip/myetheraddr.$(O) \
  src/libip/myipaddr.$(O) \
  src/libip/parseether.$(O) \
  src/libip/parseip.$(O) \
  src/libip/ptclbsum.$(O) \
  src/libip/testreadipifc.$(O) \
  src/libip/udp.$(O)
# src/libip/AIX.c
# src/libip/BSD.c
# src/libip/Darwin.c
# src/libip/DragonFly.c
# src/libip/FreeBSD.c
# src/libip/NetBSD.c
# src/libip/none.c
# src/libip/OpenBSD.c
# src/libip/SunOS.c

$(B)/libip.so: $(OBJ_IP)
	$(CC) -o $@ $(LDFLAGS) $^ $(POSIXLIBS)

OBJ_MUX = \
  src/libmux/io.$(O) \
  src/libmux/mux.$(O) \
  src/libmux/queue.$(O) \
  src/libmux/thread.$(O)

$(B)/libmux.so: $(OBJ_MUX)
	$(CC) -o $@ $(LDFLAGS) $^ $(POSIXLIBS)

$(B)/9p: src/cmd/9p.c
	$(CC) -o $@ -O2 $^ -l9 -l9p -l9pclient -lauth -lauthsrv -lsec -lmp -lbio -lthread $(POSIXLIBS)
