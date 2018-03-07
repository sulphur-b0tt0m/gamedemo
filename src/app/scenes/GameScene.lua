local Player = require("app.objects.Player")

local GameScene = class("GameScene", function()
    return display.newPhysicsScene("GameScene")
end)

function GameScene:ctor()

    self.backgroundLayer = BackgroundLayer.new()
        :addTo(self)
    -- 获取场景绑定的物理世界对象
    self.world = self:getPhysicsWorld()
    -- 设置重力大小
    self.world:setGravity(cc.p(0, -98))
    -- 开启调试模式
    --self.world:setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL)

     -- 创建一个 Player 对象
    self.player = Player.new()
    self.player:setPosition(-20, display.height * 2 / 3)
    self:addChild(self.player)
    self:playerFlyToScene()
    -- self.player:createProgress()
    -- self:addCollision()

end

-- 使创建的 Player 对象移动到场景指定位置
function GameScene:playerFlyToScene()

    local function startDrop()
    	-- 主角受重力影响
        self.player:getPhysicsBody():setGravityEnable(true)  
        self.player:drop()
        -- 开启屏幕滚动
        self.backgroundLayer:startGame()

        self.backgroundLayer:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
            return self:onTouch(event.name, event.x, event.y)
        end)
        self.backgroundLayer:setTouchEnabled(true)

    end

    local animation = display.getAnimationCache("flying")
    transition.playAnimationForever(self.player, animation)
    -- 创建一个 Sequence 动作序列对象,使一个 Node 顺序执行一批动作
    local sequence = transition.sequence({
        cc.MoveTo:create(4, cc.p(display.cx, display.height * 2 / 3)),
        -- 函数回调动作
        cc.CallFunc:create(startDrop)
    })
    self.player:runAction(sequence)
    
end

function GameScene:onEnter()
end

function GameScene:onExit()
end

return GameScene