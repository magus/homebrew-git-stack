class GitStack < Formula
  desc "stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "0.8.8"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/0.8.8/git-stack-cli-macos"
    sha256 "34042b4886fbbc651132d6e6c33daa4ca072d730bf156b91f03db31317c0a5d9"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/0.8.8/git-stack-cli-linux"
    sha256 "6aacee2397849645c59bbd390ac3390f756778a2ff9858ca96ad265bc1cd2052"
  end

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    system "#{bin}/git-stack", "--version"
  end
end
