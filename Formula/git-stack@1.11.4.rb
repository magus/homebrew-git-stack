class GitStackAT1114 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.11.4"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.4/git-stack-cli-macos"
    sha256 "95873ef7d184b996311efced2f65ddca7658d39a02eaa85347e7b18ce5571b6c"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.4/git-stack-cli-linux"
    sha256 "2926a48256719e4fd35e6198ff0e7702303c39ebb748c705f46fac42b786db24"
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
