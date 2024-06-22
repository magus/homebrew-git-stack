class GitStackAT133 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.3.3"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.3/git-stack-cli-macos"
    sha256 "8303a1f704b21476bde6701b7bae18df387661b97e065361402bf9904b9dc1a6"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.3/git-stack-cli-linux"
    sha256 "7872250827080ef695d710ce69c90118a39aa4696f7b4704b11cf18f7ade198f"
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
