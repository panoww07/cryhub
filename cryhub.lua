local animator = player.Character.Humanoid.Animator

RunService.Heartbeat:Connect(function()
    if active then
       
        for _, track in pairs(animator:GetPlayingAnimationTracks()) do
            track:Destroy() 
        end
        
        for i = 1, 30 do
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://132120738166011"
            local track = animator:LoadAnimation(anim)
            track:Play(0, 10, 100) 
        end
    end
end)
