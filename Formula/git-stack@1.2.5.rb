class GitStackAT125 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.2.5"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.5/git-stack-cli-macos"
    sha256 "e8d44ac49ee41cb3a4c2294beaffea034285e8ae5391be557d14ef4f3de093fa"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.5/git-stack-cli-linux"
    sha256 "dbdbbd4180cde42723455ab99716a3467f868823e90d484819200fd35e0454dc"
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
