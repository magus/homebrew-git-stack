class GitStackAT170 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.7.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.7.0/git-stack-cli-macos"
    sha256 "4e9a4fd75bc9e3b86b0a09c284b7eb86c6eed1c096adf0b0aa41f522dc73e412"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.7.0/git-stack-cli-linux"
    sha256 "de9950f146cdede9e13ae7e31c01ae6a5708adce8875e83efd899c1f89d06b5a"
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
