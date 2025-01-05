class GitStackAT1120 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.12.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.12.0/git-stack-cli-macos"
    sha256 "63ee2ca5f9931de321c688acd392ca7a1cd131acccc7f41ad880190e54e33549"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.12.0/git-stack-cli-linux"
    sha256 "b9f814d8adf38bbdcc7b68adfef9db0fcb7c5f82a1669c77d99ed4290c3a5a9a"
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
