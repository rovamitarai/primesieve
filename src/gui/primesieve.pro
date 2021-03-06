# ---------------------------------------------------------
# primesieve GUI project settings
# ---------------------------------------------------------

TARGET = primesieve
TEMPLATE = app
FORMS += forms/PrimeSieveGUI.ui

# ---------------------------------------------------------
# Qt modules: core, gui and widgets (Qt > 4)
# ---------------------------------------------------------

QT_VER = $$QT_VERSION
QT_VER = $$split(QT_VER, ".")
QT_MAJ = $$member(QT_VER, 0)
!contains(QT_MAJ, 4) {
  QT += core gui widgets
}

# ---------------------------------------------------------
# primesieve GUI application sources
# ---------------------------------------------------------

SOURCES += \
  src/main.cpp \
  src/PrimeSieveGUI.cpp \
  src/PrimeSieveGUI_menu.cpp \
  src/PrimeSieveProcess.cpp

HEADERS += \
  src/calculator.hpp \
  src/PrimeSieveGUI.hpp \
  src/PrimeSieveGUI_const.hpp \
  src/PrimeSieveProcess.hpp

# ---------------------------------------------------------
# Sieve of Eratosthenes sources (src/primesieve)
# ---------------------------------------------------------

INCLUDEPATH += ../../include

SOURCES += \
  ../primesieve/api.cpp \
  ../primesieve/CpuInfo.cpp \
  ../primesieve/EratBig.cpp \
  ../primesieve/EratMedium.cpp \
  ../primesieve/EratSmall.cpp \
  ../primesieve/iterator.cpp \
  ../primesieve/nthPrime.cpp \
  ../primesieve/ParallelPrimeSieve.cpp \
  ../primesieve/popcount.cpp \
  ../primesieve/PreSieve.cpp \
  ../primesieve/PrimeGenerator.cpp \
  ../primesieve/SievingPrimes.cpp \
  ../primesieve/PrimeSieve.cpp \
  ../primesieve/SieveOfEratosthenes.cpp \
  ../primesieve/Wheel.cpp

# ---------------------------------------------------------
# primesieve icon file
# ---------------------------------------------------------

win* {
  RC_FILE = icons/win/primesieve.rc
}
macx {
  RC_FILE = icons/osx/primesieve.icns
}

# ---------------------------------------------------------
# Add compiler flags
# ---------------------------------------------------------

*msvc* {
  QMAKE_CXXFLAGS += /EHsc
}

*g++* {
  QMAKE_CXXFLAGS += -std=c++11
}

*clang* {
  QMAKE_CXXFLAGS += -std=c++11
}

*icc* {
  win* {
    QMAKE_CXXFLAGS += /EHsc
  }
}
