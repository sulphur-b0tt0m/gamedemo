local Player = class("Player", function()

    return display.newSprite("#flying1.png")

end)

function Player:ctor()

	-- 调用cc.PhysicsBody:createBox()方法创建了一个矩形的 body
	-- 3个参数
	-- 参数1为 cc.size 类型，表示矩形 body 的尺寸大小
	-- 参数2为 cc.PhysicsMaterial 类型，可自定义，默认cc.PHYSICSBODY_MATERIAL_DEFAULT
	-- 参数3为 cc.p 类型，表示 body 与中心点的偏移量
	self:addAnimationCache()
	local body = cc.PhysicsBody:createBox(self:getContentSize(), cc.PHYSICSBODY_MATERIAL_DEFAULT, cc.p(0,0))
    -- 将刚体添加到精灵上
    self:setPhysicsBody(body)
    self:getPhysicsBody():setGravityEnable(false)

end

function Player:addAnimationCache()
    -- 三种动作
    local animationNames = {"flying", "drop", "die"}
    -- 三种动作分别有的总帧数
    local animationFrameNum = {4, 3, 4}
    -- i ＝ 1，创建一个包含flying1.png到flying4.png的图像帧对象的数组
    for i = 1, #animationNames do
        local frames = display.newFrames( animationNames[i] .. "%d.png", 1, animationFrameNum[i])
        -- 每0.3s播放4帧
        local animation = display.newAnimation(frames, 0.3 / 4)
        -- animation:setDelayPerUnit(0.1)
        -- 加入到动画缓存中
        display.setAnimationCache(animationNames[i], animation)
    end

end

-- 执行动画
function Player:flying()

    transition.stopTarget(self)
    transition.playAnimationForever(self, display.getAnimationCache("flying"))

end

function Player:drop()

    transition.stopTarget(self)
    transition.playAnimationForever(self, display.getAnimationCache("drop"))

end

function Player:die()

    transition.stopTarget(self)
    transition.playAnimationOnce(self, display.getAnimationCache("die"))
    
end

return Player