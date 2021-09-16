local sampev = require 'lib.samp.events'

function sampev.onShowDialog(dialogid,style,title,button1,button2,text)
print()

  file = io.open("D:\\dialogs.pwn", "a")

  file:write(string.format([[ShowPlayerDialog(playerid,%d,%d, "%s", "%s", "%s", "%s");\n\n]],dialogid,style,title,text,button1,button2))
  file:close()
end

function sampev.onShowTextDraw(textdrawId,textdraw)
  local bitex = require 'bitex'
  file = io.open("D:\\gg.pwn", "a")
  if textdrawId > 2000 then
    file:write(string.format('textdraw[playerid][%d] = CreatePlayerTextDraw(playerid, %f, %f, "%s");\n', textdrawId, textdraw.position.x, textdraw.position.y, textdraw.text))
    file:write(string.format('PlayerTextDrawFont(playerid, textdraw[playerid][%d], %d);\n', textdrawId, textdraw.style))
    file:write(string.format('PlayerTextDrawLetterSize(playerid, textdraw[playerid][%d], %f, %f);\n', textdrawId, textdraw.letterWidth, textdraw.letterHeight))
    file:write(string.format('PlayerTextDrawTextSize(playerid, textdraw[playerid][%d], %f, %f);\n', textdrawId, textdraw.lineWidth, textdraw.lineHeight))
    file:write(string.format('PlayerTextDrawSetOutline(playerid, textdraw[playerid][%d], %d);\n', textdrawId, textdraw.outline))
    file:write(string.format('PlayerTextDrawSetShadow(playerid, textdraw[playerid][%d], %d);\n', textdrawId, textdraw.shadow))

    if bitex.bextract(textdraw.flags, 1, 1) == 1 then
    file:write(string.format('PlayerTextDrawAlignment(playerid, textdraw[playerid][%d], 1);\n', textdrawId))
    end

    if bitex.bextract(textdraw.flags, 2, 1) == 1 then
    file:write(string.format('PlayerTextDrawAlignment(playerid, textdraw[playerid][%d], 3);\n', textdrawId))
    end

    if bitex.bextract(textdraw.flags, 3, 1) == 1 then
    file:write(string.format('PlayerTextDrawAlignment(playerid, textdraw[playerid][%d], 2);\n', textdrawId))
    end
    
    file:write(string.format('PlayerTextDrawUseBox(playerid, textdraw[playerid][%d], %d);\n', textdrawId, bitex.bextract(textdraw.flags, 0, 1)))

    local aa, rr, gg, bb = explode_argb( textdraw.letterColor)

    file:write(string.format('PlayerTextDrawColor(playerid, textdraw[playerid][%d], 0x%02x%02x%02x%02x);\n',textdrawId, bb, gg, rr, aa))

    local aa, rr, gg, bb = explode_argb( textdraw.backgroundColor)
    file:write(string.format('PlayerTextDrawBackgroundColor(playerid, textdraw[playerid][%d], 0x%02x%02x%02x%02x);\n',textdrawId, bb, gg, rr, aa))

    local aa, rr, gg, bb = explode_argb( textdraw.boxColor)
    file:write(string.format('PlayerTextDrawBoxColor(playerid, textdraw[playerid][%d], 0x%02x%02x%02x%02x);\n',textdrawId, bb, gg, rr, aa))
    file:write(string.format('PlayerTextDrawSetProportional(playerid, textdraw[playerid][%d], %d);\n', textdrawId, bitex.bextract(textdraw.flags, 4, 1)))
    
    if textdraw.modelId > 0 then
      file:write(string.format('PlayerTextDrawSetPreviewModel(playerid, textdraw[playerid][%d], %d);\n', textdrawId, textdraw.modelId))
      file:write(string.format('PlayerTextDrawSetPreviewRot(playerid, textdraw[playerid][%d], %f, %f, %f, %f);\n', textdrawId, textdraw.rotation.x, textdraw.rotation.y,textdraw.rotation.z,textdraw.zoom))
    end
    --file:write(string.format('(0xe30f00FF) - %x%x\n', bitex.bextract(data.letterColor, 0, 8),bitex.bextract(data.letterColor, 8, 8)))
    --file:write(string.format('(0xe30f00FF) - %x%x\n', bitex.bextract(data.letterColor, 16, 8),bitex.bextract(data.letterColor, 24, 8)))
    file:write(string.format('\n'))
  else
    file:write(string.format('textdraw[%d] = TextDrawCreate(%f, %f, "%s");\n', textdrawId, textdraw.position.x, textdraw.position.y, textdraw.text))
    file:write(string.format('TextDrawFont(textdraw[%d], %d);\n', textdrawId, textdraw.style))
    file:write(string.format('TextDrawLetterSize(textdraw[%d], %f, %f);\n', textdrawId, textdraw.letterWidth, textdraw.letterHeight))
    file:write(string.format('TextDrawTextSize(textdraw[%d], %f, %f);\n', textdrawId, textdraw.lineWidth, textdraw.lineHeight))
    file:write(string.format('TextDrawSetOutline(textdraw[%d], %d);\n', textdrawId, textdraw.outline))
    file:write(string.format('TextDrawSetShadow(textdraw[%d], %d);\n', textdrawId, textdraw.shadow))

    if bitex.bextract(textdraw.flags, 1, 1) == 1 then
    file:write(string.format('TextDrawAlignment(textdraw[%d], 1);\n', textdrawId))
    end

    if bitex.bextract(textdraw.flags, 2, 1) == 1 then
    file:write(string.format('TextDrawAlignment(textdraw[%d], 3);\n', textdrawId))
    end

    if bitex.bextract(textdraw.flags, 3, 1) == 1 then
    file:write(string.format('TextDrawAlignment(textdraw[%d], 2);\n', textdrawId))
    end
    
    file:write(string.format('TextDrawUseBox(textdraw[%d], %d);\n', textdrawId, bitex.bextract(textdraw.flags, 0, 1)))

    local aa, rr, gg, bb = explode_argb( textdraw.letterColor)

    file:write(string.format('TextDrawColor(textdraw[%d], 0x%02x%02x%02x%02x);\n',textdrawId, bb, gg, rr, aa))

    local aa, rr, gg, bb = explode_argb( textdraw.backgroundColor)
    file:write(string.format('TextDrawBackgroundColor(textdraw[%d], 0x%02x%02x%02x%02x);\n',textdrawId, bb, gg, rr, aa))

    local aa, rr, gg, bb = explode_argb( textdraw.boxColor)
    file:write(string.format('TextDrawBoxColor(textdraw[%d], 0x%02x%02x%02x%02x);\n',textdrawId, bb, gg, rr, aa))
    file:write(string.format('TextDrawSetProportional(textdraw[%d], %d);\n', textdrawId, bitex.bextract(textdraw.flags, 4, 1)))
    
    if textdraw.modelId > 0 then
      file:write(string.format('TextDrawSetPreviewModel(textdraw[%d], %d);\n', textdrawId, textdraw.modelId))
      file:write(string.format('TextDrawSetPreviewRot(textdraw[%d], %f, %f, %f, %f);\n', textdrawId, textdraw.rotation.x, textdraw.rotation.y,textdraw.rotation.z,textdraw.zoom))
    end
    --file:write(string.format('(0xe30f00FF) - %x%x\n', bitex.bextract(data.letterColor, 0, 8),bitex.bextract(data.letterColor, 8, 8)))
    --file:write(string.format('(0xe30f00FF) - %x%x\n', bitex.bextract(data.letterColor, 16, 8),bitex.bextract(data.letterColor, 24, 8)))
    file:write(string.format('\n'))
  end

  file:close()
end

function explode_argb(argb)
  local a = bit.band(bit.rshift(argb, 24), 0xFF)
  local r = bit.band(bit.rshift(argb, 16), 0xFF)
  local g = bit.band(bit.rshift(argb, 8), 0xFF)
  local b = bit.band(argb, 0xFF)
  return a, r, g, b
end

function join_argb(a, r, g, b)
  local argb = b-b
  argb = bit.bor(argb, bit.lshift(g, 8))-g
  argb = bit.bor(argb, bit.lshift(r, 16))-r
  argb = bit.bor(argb, bit.lshift(a, 24))-a
  return argb
end