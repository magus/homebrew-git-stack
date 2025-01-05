class GitStackAT1130 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.13.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.13.0/git-stack-cli-macos"
    sha256 "868ab9a5f5c2a5dec834f0cc12319ae35cf21b66b1e11fd3ed37c0eff7e51673"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.13.0/git-stack-cli-linux"
    sha256 "2b3deb5a5177c17becd9caedc498ba5ea6109be5bd6cb30c03918d3a126b00df"
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
