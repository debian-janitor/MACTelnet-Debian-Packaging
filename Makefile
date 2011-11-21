
CC?=gcc

# Run this with make LIBS=-lrt if you want to compile on kfreebsd

all: macping mndp mactelnet mactelnetd

clean: dist-clean

dist-clean:
	rm -f mactelnet macping mactelnetd mndp
	rm -f *.o

install: all install-docs
	install -d $(DESTDIR)/usr/bin
	install mndp $(DESTDIR)/usr/bin/
	install macping $(DESTDIR)/usr/bin/
	install mactelnet $(DESTDIR)/usr/bin/
	install -d $(DESTDIR)/usr/sbin
	install -o root mactelnetd $(DESTDIR)/usr/sbin/
	install -d $(DESTDIR)/etc
	install -m 600 -o root config/mactelnetd.users $(DESTDIR)/etc/

install-docs:
	install -d $(DESTDIR)/usr/share/man/man1/
	install docs/*.1 $(DESTDIR)/usr/share/man/man1/

users.o: users.c users.h
	${CC} -Wall ${CFLAGS} -DUSERSFILE='"/etc/mactelnetd.users"' -c users.c

protocol.o: protocol.c protocol.h
	${CC} -Wall ${CFLAGS} -c protocol.c

interfaces.o: interfaces.c interfaces.h
	${CC} -Wall ${CFLAGS} -c interfaces.c

md5.o: md5.c md5.h
	${CC} -Wall ${CFLAGS} -c md5.c

mactelnet: config.h mactelnet.c mactelnet.h protocol.o console.c console.h interfaces.o md5.o
	${CC} -Wall ${CFLAGS} ${LDFLAGS} -o mactelnet mactelnet.c protocol.o console.c interfaces.o md5.o ${LIBS}

mactelnetd: config.h mactelnetd.c protocol.o interfaces.o console.c console.h users.o users.h md5.o
	${CC} -Wall ${CFLAGS} ${LDFLAGS} -o mactelnetd mactelnetd.c protocol.o console.c interfaces.o users.o md5.o ${LIBS}

mndp: config.h mndp.c protocol.o
	${CC} -Wall ${CFLAGS} ${LDFLAGS} -o mndp mndp.c protocol.o ${LIBS}

macping: config.h macping.c interfaces.o protocol.o
	${CC} -Wall ${CFLAGS} ${LDFLAGS} -o macping macping.c interfaces.o protocol.o ${LIBS}
