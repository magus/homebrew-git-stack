class GitStackAT160 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.6.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.6.0/git-stack-cli-macos"
    sha256 "e1ee487b644730143d39818e8d96f98c3fbab831775d67ad0d3ae9084121ab9a"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.6.0/git-stack-cli-linux"
    sha256 "234454b511baa0e98c3d964f1e049e5904541ec8964e61a5fbc78832c9b8602c"
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
