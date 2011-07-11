--- D-ITG-2.7.0-Beta2/src/common/serial.cpp	2009-05-24 10:48:18.000000000 +0200
+++ D-ITG-2.7.0-Beta2.new/src/common/serial.cpp	2010-03-21 17:22:54.000000000 +0100
@@ -84,7 +84,7 @@
 #include <unistd.h>
 #include <termios.h>
 #if !defined(BSD) && !defined(ARM)
-#include <stropts.h>
+//#include <stropts.h>
 #endif
 #include <fcntl.h>
 #include <stdio.h>
