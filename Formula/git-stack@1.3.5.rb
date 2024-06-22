class GitStackAT135 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.3.5"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.5/git-stack-cli-macos"
    sha256 "3c47a19a886e52ac2b6edc7dc7a83b26fc9e91cd658f1219a6895fc4126591d9"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.5/git-stack-cli-linux"
    sha256 "81fef8cc0a55d5afc72879a1d40aa057b925f3c6c2c0974f2da4de8fafd0704e"
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
