local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    -- display.newSprite("image/start1.png")
    --     :pos(display.cx, display.cy)
    --     :addTo(self)

    -- UIPushButton写法一：
    -- cc.ui.UIPushButton.new({normal="image/start1.png",pressed="image/start2.png",disabled="image/start3.png"})
    -- 	:setButtonSize(60, 60)
    -- 	:align(display.LEFT_CENTER, display.left + 80, display.top - 80)
    -- 	:onButtonClicked(function ()
    -- 		app:enterScene("GameScene", nil, "SLIDEINT", 1.0)
    -- 		-- body
    -- 	end)
    -- 	:addTo(self)

    -- UIPushButton写法二：
    -- local start_btn = cc.ui.UIPushButton.new({normal="image/start1.png",pressed="image/start2.png",disabled="image/start3.png"})
    -- 	:setButtonSize(60, 60)
    -- 	:align(display.LEFT_CENTER, display.left + 160, display.top - 80)
    -- 	:onButtonClicked(function ()
    -- 		app:enterScene("GameScene", nil, "SLIDEINT", 1.0)
    -- 		-- body
    -- 	end)
    -- 	:addTo(self)

    -- local btn=cc.ui.UIPushButton.new("image/start1.png")
    -- 	:setButtonSize(60, 60)
    -- 	:onButtonClicked(function() 
    -- 			app:enterScene("GameScene", nil, "SLIDEINT", 1.0) 
    -- 	end)
    -- 	:align(display.CENTER,60,60)
    -- 	:addTo(self)

    display.newSprite("image/main.jpg")
        :pos(display.cx, display.cy)
        :addTo(self)
    
    local title = display.newSprite("image/title.png")
        :pos(display.cx / 2 * 3, display.cy)
        :addTo(self)

    local move1 = cc.MoveBy:create(0.5, cc.p(0, 10))
    local move2 = cc.MoveBy:create(0.5, cc.p(0, -10))
    local SequenceAction = cc.Sequence:create( move1, move2 )
    transition.execute(title, cc.RepeatForever:create( SequenceAction ))

    local sequence = transition.sequence({
        cc.MoveTo:create(0.5, cc.p(display.cx, display.cy)),
        cc.FadeOut:create(0.2),
        cc.DelayTime:create(0.5),
        cc.FadeIn:create(0.3),
    })

    cc.ui.UIPushButton.new({ normal = "image/start1.png", pressed = "image/start2.png" })
        :onButtonClicked(function()
            print("start")
            -- audio.playSound("sound/button.wav")
            app:enterScene("GameScene", nil, "SLIDEINT", 1.0)
        end)
        :pos( display.cx / 2, display.cy )
        :addTo(self)

end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene