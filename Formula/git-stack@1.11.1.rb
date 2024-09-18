class GitStackAT1111 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.11.1"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.1/git-stack-cli-macos"
    sha256 "077d405b86cddacb1c8be12a7658fae1114914b77297214c223176808d789fcf"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.1/git-stack-cli-linux"
    sha256 "7339101b3fa378360bd928fb57c468fddf2a7e4afb907d7cf0afa044b19e3de0"
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
