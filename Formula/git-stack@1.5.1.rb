class GitStackAT151 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.5.1"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.5.1/git-stack-cli-macos"
    sha256 "6f43c3356387833ad1a3d0415134ab05b6911b6c4cab1ebcecbc9db4a488a8c9"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.5.1/git-stack-cli-linux"
    sha256 "6f801ab8c97159cacf5fe17471ce4bf12ed78d8b6bee6f711e7b0fac574eac73"
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
