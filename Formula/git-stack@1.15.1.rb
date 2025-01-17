class GitStackAT1151 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.15.1"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.15.1/git-stack-cli-macos"
    sha256 "77c11537d8950b768446c83f8e32420926e0b663d3bd4be0ffdaae078943ed4d"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.15.1/git-stack-cli-linux"
    sha256 "763be87bcc2be628ba97a61f6eaf9ea871de91f28c7d8b8010550642f89b0910"
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
