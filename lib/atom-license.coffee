module.exports =
  activate: ->
    atom.workspaceView.command "license:Apache-2․0", => @apache2()
    atom.workspaceView.command "license:MIT", => @mit()
    atom.workspaceView.command "license:BSD", => @bsd()
    atom.workspaceView.command "license:Artistic-2․0", => @artist2()
    atom.workspaceView.command "license:GPL-v2", => @gplv2()
    atom.workspaceView.command "license:GPL-v3", => @gplv3()
    atom.workspaceView.command "license:LGPL-v2․1", => @lgplv21()
    atom.workspaceView.command "license:LGPL-v3", => @lgplv3()
    atom.workspaceView.command "license:Mozilla", => @mozilla()
    atom.workspaceView.command "license:The-Unlicense", => @unlicense()

  mit: ->
    @addLicense("mit")

  bsd: ->
    @addLicense("bsd2")

  apache2: ->
    @addLicense("apache20")

  artist2: ->
    @addLicense("artistic20")

  gplv2: ->
    @addLicense("gplv2")

  gplv3: ->
    @addLicense("gplv3")

  lgplv21: ->
    @addLicense("lgplv21")

  lgplv3: ->
    @addLicense("lgplv3")

  mozilla: ->
    @addLicense("mozilla")

  unlicense: ->
    @addLicense("unlicense")

  addLicense: (name)->
    editor = atom.workspace.activePaneItem
    @getLicenseText name, (err, license)->
      editor.insertText(license)

  getLicenseText: (name, next) ->
    fs = require "fs"
    file = __dirname + '/licenses/' + name + ".txt"
    fs.readFile file, 'utf8', next
