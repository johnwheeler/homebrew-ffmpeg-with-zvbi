require "formula"

class Zvbi < Formula
  homepage 'http://zapping.sourceforge.net/'
  url "http://downloads.sourceforge.net/project/zapping/zvbi/0.2.35/zvbi-0.2.35.tar.bz2"
  sha256 "fc883c34111a487c4a783f91b1b2bb5610d8d8e58dcba80c7ab31e67e4765318"

  # two of the unit tests fail on Mac OS - see
  # http://sourceforge.net/p/zapping/bugs/197/ - so remove them until
  # fixed so that we can run the rest of the tests
  def patches
    DATA
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--without-x",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "check"
    system "make", "install"
  end
end
