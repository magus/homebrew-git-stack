class GitStackAT1117 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.11.7"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.7/git-stack-cli-macos"
    sha256 "a15135f421edfd58e4d76cf3006cdc5061beaa651ded1771d829848c5c2b5958"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.7/git-stack-cli-linux"
    sha256 "ea21f983568a8bc13b124df0d24666f1dacf4c40d2315047ee7f18b906f1247a"
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
