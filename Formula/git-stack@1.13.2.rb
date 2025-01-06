class GitStackAT1132 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.13.2"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.13.2/git-stack-cli-macos"
    sha256 "cda278b19173437fe5604e778413da0aec9a1b3575777b5e428d58d3f00ea546"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.13.2/git-stack-cli-linux"
    sha256 "58390dc5f423a855dfb2d5966d53810d88cf20074a573e4df661df50fc95ee18"
  end

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
