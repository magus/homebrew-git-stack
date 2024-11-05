class GitStackAT1116 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.11.6"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.6/git-stack-cli-macos"
    sha256 "dc4349fdc3081a4e208e93a248a60f7dd334df88c314c5c0e4e34190eebab1ee"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.6/git-stack-cli-linux"
    sha256 "519a8bfd86c80270d39f24555d25bfb5e8b5f92d5d51f28e9998d1a9a9a1047b"
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
