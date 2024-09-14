class GitStackAT1110 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.11.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.0/git-stack-cli-macos"
    sha256 "632c3a2925d9ae9ea6992989c044404cd57de4c462e47ac90e75b1f89e575f4d"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.11.0/git-stack-cli-linux"
    sha256 "d69e796c9f42c6be1f58a1e0212399d5ba254c529df99f181fff50814aec9959"
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
