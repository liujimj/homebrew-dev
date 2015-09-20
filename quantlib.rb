class Quantlib < Formula
  desc "Library for quantitative finance"
  homepage "http://quantlib.org/"
  url "https://downloads.sourceforge.net/project/quantlib/QuantLib/1.6.2/QuantLib-1.6.2.tar.gz"
  mirror "https://distfiles.macports.org/QuantLib/QuantLib-1.6.2.tar.gz"
  sha256 "049481a7b7e6f19792ab7e3985a8dd058fb2972b28086999b083010d4dd27d14"

  head do
    url "https://github.com/lballabio/quantlib.git"
    depends_on "automake" => :build
    depends_on "autoconf" => :build
    depends_on "libtool" => :build
  end

  bottle do
    cellar :any
    sha256 "128bb13a29b675d4d918fe846b6898c16dcff7bdc68ccb7b02b9534514085d76" => :yosemite
    sha256 "6cfa46314ac7485a695b955caaf1f695143f4d992feedee46b7a35a6085dce9d" => :mavericks
    sha256 "b4a92d817a27f6d3d848d3ef51db76646ade2f372a050116859ab3f6d8be6b43" => :mountain_lion
  end

  option :cxx11
  option "with-openmp", "Enable OpenMPI support (gcc only)."
  option "with-error-lines", "File and line information is added to the error messages thrown by the library."
  option "with-error-functions", "Current function information is added to the error messages thrown by the library."
  option "with-tracing", "Tacing messages might be emitted by the library depending on run-time settings. Enabling this option can degrade performance."
  option "with-indexed-coupons", "Indexed coupons (see the documentation) are used in floating legs. If disabled (the default), par coupons are used."
  option "with-negative-rates", "If enabled (the default), negative yield rates are allowed.  If disabled, some features (notably, curve bootstrapping) will throw when negative rates are found."
  option "with-extra-safety-checks"
  option "with-sessions", "If enabled, extra run-time checks are added to a few functions. This can prevent their inlining and degrade performance."
  option "with-examples", "If enabled, singletons will return different instances for different sessions. You will have to provide and link with the library a sessionId() function in namespace QuantLib, returning a different session id for each session."
  option "with-benchmark", "If enabled, examples are built and installed when make and make install are invoked. If disabled (the default) they are built but not installed."

  if build.cxx11?
    if build.with? "openmp"
      depends_on "boost" => ["c++11", "with-mpi"]
    else
      depends_on "boost" => "c++11"
    end
  else
    depends_on "boost"
  end

  def install
    args = ["-j#{ENV.make_jobs}"]
    ENV["MAKEFLAGS"] = "-j#{ENV.make_jobs}"

    ENV.cxx11 if build.cxx11?

    # A workaround for the reported linking problems under Mac OS X 10.9 (Mavericks)
    if MacOS.version == :mavericks
      ENV['CXXFLAGS'] = ENV['LDFLAGS'] = "-stdlib=libstdc++ -mmacosx-version-min=10.6"
    end

    if build.with? "openmp"
      if ENV.compiler == :clang
        opoo "OpenMP support will not be enabled."
      end
      args << "--enable-openmp"
    end

    args << "--enable-error-lines" if build.with? "error-lines"
    args << "--enable-error-functions" if build.with? "error-functions"
    args << "--enable-tracing" if build.with? "tracing"
    args << "--enable-indexed-coupons" if build.with? "indexed-coupons"
    args << "--enable-negative-rates" if build.with? "negative-rates"
    args << "--enable-extra-safety-checks" if build.with? "extra-safety-checks"
    args << "--enable-sessions" if build.with? "sessions"
    args << "--enable-examples" if build.with? "examples"
    args << "--enable-benchmark" if build.with? "benchmark"    

    if build.head?
      Dir.chdir "QuantLib"
      system "./autogen.sh"
    end
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-static",
                          "--with-lispdir=#{share}/emacs/site-lisp/quantlib"
    system "make", *args, "install"
  end

  test do
    system bin/"quantlib-config", "--prefix=#{prefix}", "--libs", "--cflags"
  end
end