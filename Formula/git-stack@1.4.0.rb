class GitStackAT140 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.4.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.4.0/git-stack-cli-macos"
    sha256 "834f3c67ee80f717036f343c58175f6de970c0232bf91c8824c5bdc4de668016"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.4.0/git-stack-cli-linux"
    sha256 "f5c4cfa8b6d59ba4f9a350a4493874ee5798d8a61a31e0dbfed7c1e4d8ed894b"
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
