class GitStackAT211beta < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "2.1.1-beta"

  if OS.mac?
    if Hardware::CPU.arm? || Hardware::CPU.in_rosetta2?
      url "https://github.com/magus/git-stack-cli/releases/download/2.1.1-beta/git-stack-bun-darwin-arm64.zip"
      sha256 "b8fac4906524ea204356357a49753bfcf7c08a5ffff6957577b713d13f8e524c"

      def filename
        "git-stack-bun-darwin-arm64.zip"
      end
    else
      url "https://github.com/magus/git-stack-cli/releases/download/2.1.1-beta/git-stack-bun-darwin-x64.zip"
      sha256 "c8b0081dbca98cd53a2eb6880f1f56eba515424fff13ff8c86f48af575615ee7"

      def filename
        "git-stack-bun-darwin-x64.zip"
      end
    end
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/2.1.1-beta/git-stack-bun-linux-x64.zip"
    sha256 "4bfc0c7e3a0d862465cdf6a523987387d0cb2d278b9bf45e108a09f23c4f5411"

    def filename
      "git-stack-bun-linux-x64.zip"
    end
  else
    odie "Unsupported platform. Please submit a bug report here: https://github.com/magus/git-stack-cli/issues\n#{OS.report}"
  end

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    binary_name = filename.sub(/\.zip$/, "")
    bin.install binary_name => "git-stack"
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
