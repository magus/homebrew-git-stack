class GitStackAT275 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "2.7.5"

  if OS.mac?
    if Hardware::CPU.arm? || Hardware::CPU.in_rosetta2?
      url "https://github.com/magus/git-stack-cli/releases/download/2.7.5/git-stack-bun-darwin-arm64.zip"
      sha256 "985064c4ae09f7cc9ee51dca87c11f24895cd85bd6bcf4b0190ff49348f7492e"

      def filename
        "git-stack-bun-darwin-arm64.zip"
      end
    else
      url "https://github.com/magus/git-stack-cli/releases/download/2.7.5/git-stack-bun-darwin-x64.zip"
      sha256 "a5cb525003fa028b7174bcd0ba233c9f8c98b17b2e55a4e0a772c504c92401fe"

      def filename
        "git-stack-bun-darwin-x64.zip"
      end
    end
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/2.7.5/git-stack-bun-linux-x64.zip"
    sha256 "bf819b33caaa5acb3caa8db635df7da5615d7eca992fcdb4807c4ee317186b7f"

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
