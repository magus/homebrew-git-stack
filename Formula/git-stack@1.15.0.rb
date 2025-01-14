class GitStackAT1150 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.15.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.15.0/git-stack-cli-macos"
    sha256 "4f702bce5d969ec325c9f993a493fb33140f4763bb25548f19a78514f4c1c857"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.15.0/git-stack-cli-linux"
    sha256 "64869302e1195d4f16088d87676a2fdfdfefadff344f7cfc35a9d3ee41f1a602"
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
