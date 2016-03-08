# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Direwolf < Formula
  desc "Soundcard-based modem/TNC"
  homepage "https://groups.yahoo.com/neo/groups/direwolf_packet/info"
  head "https://github.com/wb2osz/direwolf.git"
  url "https://github.com/wb2osz/direwolf/archive/1.3-dev-K.tar.gz"
  version "1.3-dev-K"
  sha256 "1e997e24e1a396b6c1c9c216f226b79b362703150478c4deefffc8df1f90d4f9"

  depends_on "portaudio"

  def install
    inreplace "Makefile.macosx", "/opt", "/usr"
    inreplace "Makefile.macosx", "-m32", ""
    inreplace "Makefile.macosx", "$(shell ./search_sdks.sh)", ""
    system "make"
    bin.install "direwolf"
    prefix.install "direwolf.conf"
  end

  def caveats; <<-EOS.undent
    Remember to copy and edit the configuration file to your home folder:

    cp #{prefix}/direwolf.conf ~/direwolf.conf
    EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test direwolf`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
