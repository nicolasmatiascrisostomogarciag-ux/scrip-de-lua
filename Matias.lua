-- ========================================================
--         PROJECT: MATIAS STRESS ENGINE V3
--         STATUS: [ ACTIVE ] - BY: MATIAS
-- ========================================================

local Autor = "MATIAS"
print(">>> " .. Autor .. " ENGINE CARGADO CON ÉXITO <<<")

local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")

-- CONFIGURACIÓN DE IMPACTO
local INTENSIDAD = 65    -- Cantidad de objetos por ciclo (Sube esto para más LAG)
local DURACION = 4       -- Segundos que vive cada objeto (Evita que TU PC explote)
local RADIO = 15         -- Área de dispersión de los objetos

-- FUNCIÓN DE CARGA DE FÍSICA ASIMÉTRICA
local function IniciarSecuenciaMatias()
    local char = game.Players.LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local posBase = char.HumanoidRootPart.Position + Vector3.new(0, 15, 0)

    for i = 1, INTENSIDAD do
        local p = Instance.new("Part")
        p.Name = "Matias_Stress_Part"
        p.Shape = Enum.PartType.Ball
        p.Size = Vector3.new(3, 3, 3)
        p.Position = posBase + Vector3.new(math.random(-RADIO, RADIO), 0, math.random(-RADIO, RADIO))
        p.Velocity = Vector3.new(math.random(-100, 100), 200, math.random(-100, 100))
        p.BrickColor = BrickColor.random()
        
        -- OPTIMIZACIÓN EXCLUSIVA PARA MATIAS:
        p.Transparency = 0.8  -- Menos trabajo para tu GPU (tarjeta de video)
        p.CastShadow = false  -- Desactiva sombras para que TÚ no pierdas FPS
        p.CanCollide = true   -- Mantiene la física activa (esto es lo que da LAG)
        p.Material = Enum.Material.Neon -- Brilla pero es ligero de procesar
        
        p.Parent = workspace
        
        -- Limpieza automática para que el juego no se cierre por completo
        Debris:AddItem(p, DURACION)
    end
end

-- EJECUCIÓN CONTINUA
RunService.Heartbeat:Connect(function()
    IniciarSecuenciaMatias()
end)

warn("EL MOTOR DE " .. Autor .. " ESTÁ CORRIENDO A MÁXIMA POTENCIA")
