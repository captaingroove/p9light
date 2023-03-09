cmake_minimum_required(VERSION 3.21)

project(p9light)

## Set the C standard and warning level
set(CMAKE_C_STANDARD 99)
set(C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
add_definitions(-D_POSIX_C_SOURCE=200809L)

set(CMAKE_PREFIX_PATH
	${PROJECT_SOURCE_DIR}/../sys
)
set(CMAKE_INSTALL_PREFIX
	${CMAKE_PREFIX_PATH}
)
include_directories(
	${CMAKE_PREFIX_PATH}/include
)
link_directories(
	${CMAKE_PREFIX_PATH}/lib
)

include_directories(
  include
)

set(POSIXLIBS
  pthread
  m
  z
)

add_library(9
  src/lib9/_exits.c
  src/lib9/_p9dialparse.c
  src/lib9/_p9dir.c
  src/lib9/announce.c
  src/lib9/argv0.c
  src/lib9/atexit.c
  src/lib9/atoi.c
  src/lib9/atol.c
  src/lib9/atoll.c
  src/lib9/atnotify.c
  src/lib9/await.c
  src/lib9/cistrcmp.c
  src/lib9/cistrncmp.c
  src/lib9/cistrstr.c
  src/lib9/cleanname.c
  src/lib9/convD2M.c
  src/lib9/convM2D.c
  src/lib9/convM2S.c
  src/lib9/convS2M.c
  src/lib9/crypt.c
  src/lib9/ctime.c
  src/lib9/dial.c
  src/lib9/dirfstat.c
  src/lib9/dirfwstat.c
  src/lib9/dirmodefmt.c
  src/lib9/dirstat.c
  src/lib9/dirwstat.c
  src/lib9/dup.c
  src/lib9/encodefmt.c
  src/lib9/errstr.c
  src/lib9/exec.c
  src/lib9/execl.c
  src/lib9/exitcode.c
  src/lib9/fcallfmt.c
  src/lib9/frand.c
  src/lib9/get9root.c
  src/lib9/getcallerpc.c
  src/lib9/getenv.c
  src/lib9/getfields.c
  src/lib9/getnetconn.c
  src/lib9/getns.c
  src/lib9/getuser.c
  src/lib9/getwd.c
  src/lib9/jmp.c
  src/lib9/lrand.c
  src/lib9/lnrand.c
  src/lib9/main.c
  src/lib9/malloc.c
  src/lib9/malloctag.c
  src/lib9/mallocz.c
  src/lib9/nan.c
  src/lib9/needsrcquote.c
  src/lib9/needstack.c
  src/lib9/netcrypt.c
  src/lib9/netmkaddr.c
  src/lib9/notify.c
  src/lib9/nrand.c
  src/lib9/nulldir.c
  src/lib9/open.c
  src/lib9/opentemp.c
  src/lib9/pin.c
  src/lib9/pipe.c
  src/lib9/post9p.c
  src/lib9/postnote.c
  src/lib9/qlock.c
  src/lib9/quote.c
  src/lib9/rand.c
  src/lib9/read9pmsg.c
  src/lib9/readcons.c
  src/lib9/readn.c
  src/lib9/rfork.c
  src/lib9/searchpath.c
  src/lib9/sendfd.c
  src/lib9/sleep.c
  src/lib9/strdup.c
  src/lib9/strecpy.c
  src/lib9/sysfatal.c
  src/lib9/syslog.c
  src/lib9/sysname.c
  src/lib9/time.c
  src/lib9/tm2sec.c
  src/lib9/tokenize.c
  src/lib9/truerand.c
  src/lib9/u16.c
  src/lib9/u32.c
  src/lib9/u64.c
  src/lib9/unsharp.c
  src/lib9/wait.c
  src/lib9/waitpid.c
  src/lib9/write.c
  src/lib9/zoneinfo.c
  src/lib9/fmt/dofmt.c
  src/lib9/fmt/fltfmt.c
  src/lib9/fmt/fmt.c
  src/lib9/fmt/fmtfd.c
  src/lib9/fmt/fmtfdflush.c
  src/lib9/fmt/fmtlocale.c
  src/lib9/fmtlock2.c
  src/lib9/fmt/fmtnull.c
  src/lib9/fmt/fmtprint.c
  src/lib9/fmt/fmtquote.c
  src/lib9/fmt/fmtrune.c
  src/lib9/fmt/fmtstr.c
  src/lib9/fmt/fmtvprint.c
  src/lib9/fmt/fprint.c
  src/lib9/frexp.c
  src/lib9/fmt/nan64.c
  src/lib9/fmt/print.c
  src/lib9/fmt/runefmtstr.c
  src/lib9/fmt/runeseprint.c
  src/lib9/fmt/runesmprint.c
  src/lib9/fmt/runesnprint.c
  src/lib9/fmt/runesprint.c
  src/lib9/fmt/runevseprint.c
  src/lib9/fmt/runevsmprint.c
  src/lib9/fmt/runevsnprint.c
  src/lib9/fmt/seprint.c
  src/lib9/fmt/smprint.c
  src/lib9/fmt/snprint.c
  src/lib9/fmt/sprint.c
  src/lib9/fmt/strtod.c
  src/lib9/fmt/vfprint.c
  src/lib9/fmt/vseprint.c
  src/lib9/fmt/vsmprint.c
  src/lib9/fmt/vsnprint.c
  src/lib9/fmt/charstod.c
  src/lib9/fmt/pow10.c
  src/lib9/utf/rune.c
  src/lib9/utf/runestrcat.c
  src/lib9/utf/runestrchr.c
  src/lib9/utf/runestrcmp.c
  src/lib9/utf/runestrcpy.c
  src/lib9/utf/runestrdup.c
  src/lib9/utf/runestrlen.c
  src/lib9/utf/runestrecpy.c
  src/lib9/utf/runestrncat.c
  src/lib9/utf/runestrncmp.c
  src/lib9/utf/runestrncpy.c
  src/lib9/utf/runestrrchr.c
  src/lib9/utf/runestrstr.c
  src/lib9/utf/runetype.c
  src/lib9/utf/utfecpy.c
  src/lib9/utf/utflen.c
  src/lib9/utf/utfnlen.c
  src/lib9/utf/utfrrune.c
  src/lib9/utf/utfrune.c
  src/lib9/utf/utfutf.c
)

target_link_libraries(9
  ${POSIXLIBS}
)

add_library(bio
  src/libbio/bbuffered.c
  src/libbio/bfildes.c
  src/libbio/bflush.c
  src/libbio/bgetc.c
  src/libbio/bgetrune.c
  src/libbio/bgetd.c
  src/libbio/binit.c
  src/libbio/boffset.c
  src/libbio/bprint.c
  src/libbio/bputc.c
  src/libbio/bputrune.c
  src/libbio/brdline.c
  src/libbio/brdstr.c
  src/libbio/bread.c
  src/libbio/bseek.c
  src/libbio/bvprint.c
  src/libbio/bwrite.c
)

target_link_libraries(bio
  ${POSIXLIBS}
)

add_library(regexp
  src/libregexp/regcomp.c
  src/libregexp/regerror.c
  src/libregexp/regexec.c
  src/libregexp/regsub.c
  src/libregexp/regaux.c
  src/libregexp/rregexec.c
  src/libregexp/rregsub.c
)

target_link_libraries(regexp
  ${POSIXLIBS}
)

add_library(thread
  src/libthread/bg.c
  src/libthread/channel.c
  src/libthread/daemonize.c
  src/libthread/exec.c
  src/libthread/ioproc.c
  src/libthread/iorw.c
  src/libthread/pthread.c
  src/libthread/ref.c
  src/libthread/thread.c
  src/libthread/wait.c
)

target_link_libraries(thread
  ${POSIXLIBS}
)

add_library(9p
  src/lib9p/dirread.c
  src/lib9p/fid.c
  src/lib9p/file.c
  # src/lib9p/ftest.c   ## Just a test program with a main() entry point
  src/lib9p/intmap.c
  src/lib9p/mem.c
  src/lib9p/parse.c
  # src/lib9p/ramfs.c   ## Just a test program with a main() entry point
  src/lib9p/req.c
  src/lib9p/srv.c
  src/lib9p/tpost.c
  src/lib9p/uid.c
  src/lib9p/util.c
)

target_link_libraries(9p
  ${POSIXLIBS}
)

add_library(9pclient
  src/lib9pclient/access.c
  src/lib9pclient/auth.c
  src/lib9pclient/close.c
  src/lib9pclient/create.c
  src/lib9pclient/dirread.c
  src/lib9pclient/fs.c
  src/lib9pclient/ns.c
  src/lib9pclient/open.c
  src/lib9pclient/openfd.c
  src/lib9pclient/print.c
  src/lib9pclient/read.c
  src/lib9pclient/remove.c
  src/lib9pclient/seek.c
  src/lib9pclient/stat.c
  src/lib9pclient/walk.c
  src/lib9pclient/write.c
  src/lib9pclient/wstat.c
)

target_link_libraries(9pclient
  ${POSIXLIBS}
)

add_executable(threads test/threads.c )
target_link_libraries(threads thread 9 ${POSIXLIBS} )

add_executable(hellosrv test/hellosrv.c )
target_link_libraries(hellosrv 9pclient 9p thread 9 ${POSIXLIBS} )

install(TARGETS 9 9p 9pclient bio regexp thread DESTINATION lib)
install(DIRECTORY include/ DESTINATION include/p9)
