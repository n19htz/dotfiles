from ranger.api.commands import Command

class code(Command):
  """
  :code
  Opens current directory in VSCode
  """

  def execute(self):
    dirname = self.fm.thisdir.path
    codecmd = ["code", dirname]
    self.fm.execute_command(codecmd)

class storm(Command):
  """
  :storm
  Opens current directory in Webstorm
  """

  def execute(self):
    dirname = self.fm.thisdir.path
    codecmd = ["storm", dirname]
    self.fm.execute_command(codecmd)

class goland(Command):
  """
  :goland
  Opens current directory in GoLand
  """

  def execute(self):
    dirname = self.fm.thisdir.path
    codecmd = ["goland", dirname]
    self.fm.execute_command(codecmd)

class mvim(Command):
  """
  :mvim
  Opens current directory or file in MacVim
  """

  def execute(self):
    filename = self.fm.thisfile.path
    codecmd = ["mvim", filename]
    self.fm.execute_command(codecmd)
