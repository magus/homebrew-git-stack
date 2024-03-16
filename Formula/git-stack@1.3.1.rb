class GitStackAT131 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.3.1"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.1/git-stack-cli-macos"
    sha256 "65e273e5ceff9bdc3fd0e96440f7550ce78e2ee271e6eb2553bbea3c0c0141ae"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.1/git-stack-cli-linux"
    sha256 "0bf116f39051a21bc96a23f11040ad06963aebedfc2991b84e005d2154678b5a"
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
