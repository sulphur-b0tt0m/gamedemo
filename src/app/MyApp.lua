
require("config")
require("cocos.init")
require("framework.init")
require("app.layers.BackgroundLayer")
require("app.objects.Player")
require("app.objects.Heart")
require("app.objects.Airship")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    cc.Director:getInstance():setContentScaleFactor(640 / CONFIG_SCREEN_HEIGHT)
    display.addSpriteFrames("image/player.plist","image/player.pvr.ccz")
    self:enterScene("MainScene")
end

return MyApp
