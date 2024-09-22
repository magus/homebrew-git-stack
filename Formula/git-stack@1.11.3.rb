class GitStackAT1113 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.11.3"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.3/git-stack-cli-macos"
    sha256 "deed437e33de33817f1ee99d195d0f0d7b7f9b0225798968dc235a0f7f36f6ef"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.3/git-stack-cli-linux"
    sha256 "b3f6498864e8356e3198d8f83479315e493e79099fe7f23901217b7c6a68dc41"
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
