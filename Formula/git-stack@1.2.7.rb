class GitStackAT127 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.2.7"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.7/git-stack-cli-macos"
    sha256 "ff488a12c102e7f6647ca13178343b933158ff834ef981f61963fa35f06ad517"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.7/git-stack-cli-linux"
    sha256 "3f5820f4fbb3a6de547938929bfdab673cc1613c045d1fbb6a960e11f69f88eb"
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
