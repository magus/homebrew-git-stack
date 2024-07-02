class GitStackAT150 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.5.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.5.0/git-stack-cli-macos"
    sha256 "f69fab0f61c5649c76fbe33cf5bd1be2849be3d3feacae475a04a3f402d4e972"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.5.0/git-stack-cli-linux"
    sha256 "4ad8f095ca951e83fd9dfe0372699a2deb3efa0c9533ba5e45da8bb4e8303a68"
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
