class GitStackAT181 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.8.1"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.8.1/git-stack-cli-macos"
    sha256 "12bad334bad10598e2fd52cddac8fdc2a66895dc69fea48f43460d7e414744d8"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.8.1/git-stack-cli-linux"
    sha256 "d814e68548232ec155fbf621df00e96e418d1ee0f8ef50b8e2f671856eedb989"
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
