class GitStack < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.2.2"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.2/git-stack-cli-macos"
    sha256 "056f5a1cf5576f17f283cc405f22b6d0a046c810cb3feb46206b6efce7c378f8"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.2/git-stack-cli-linux"
    sha256 "1eb15323fe640a812a0f20f77acafec4a7c7372834097648f7d7e74d757a5455"
  end

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
