-----------------------------------------------------------
PlayerInfo = 
{
	m_iType = ProtocolId.,	m_iPlayerId = 0,
	m_sNickName = "",
	m_iGender = 0,
}

function PlayerInfo:clone()
	local inst_tbl = CopyTable(self);
	return inst_tbl;
end

function PlayerInfo:marshal(oct)
	oct:PushUInt32(self.m_iPlayerId);
	oct:PushUString(self.m_sNickName);
	oct:PushUInt8(self.m_iGender);
end

function PlayerInfo:unmarshal(oct)
	self.m_iPlayerId = oct:PopUInt32();
	self.m_sNickName = oct:PopUString();
	self.m_iGender = oct:PopUInt8();
end

-----------------------------------------------------------
--登入游戏
LoginGame = 
{
	m_iType = ProtocolId.LOGIN_GAME,	m_sName = "",
	m_sPwd = "",
	m_iFlag = 0,
}

function LoginGame:clone()
	local inst_tbl = CopyTable(self);
	return inst_tbl;
end

function LoginGame:marshal(oct)
	oct:PushUString(self.m_sName);
	oct:PushUString(self.m_sPwd);
	oct:PushUInt8(self.m_iFlag);
end

function LoginGame:unmarshal(oct)
	self.m_sName = oct:PopUString();
	self.m_sPwd = oct:PopUString();
	self.m_iFlag = oct:PopUInt8();
end

-----------------------------------------------------------
--踢出游戏
KickoutGame = 
{
	m_iType = ProtocolId.KICKOUT_GAME,	m_iPlayerId = 0,
	m_sName = "",
}

function KickoutGame:clone()
	local inst_tbl = CopyTable(self);
	return inst_tbl;
end

function KickoutGame:marshal(oct)
	oct:PushUInt32(self.m_iPlayerId);
	oct:PushUString(self.m_sName);
end

function KickoutGame:unmarshal(oct)
	self.m_iPlayerId = oct:PopUInt32();
	self.m_sName = oct:PopUString();
end

-----------------------------------------------------------
--玩家初始化
PlayerInit = 
{
	m_iType = ProtocolId.PLAYER_INIT,	m_sInfo = PlayerInfo,
}

function PlayerInit:clone()
	local inst_tbl = CopyTable(self);
	inst_tbl.m_sInfo = self.m_sInfo:clone();
	return inst_tbl;
end

function PlayerInit:marshal(oct)
	self.m_sInfo:marshal(oct);
end

function PlayerInit:unmarshal(oct)
	self.m_sInfo = PlayerInfo:clone();
	self.m_sInfo:unmarshal(oct);
end

-----------------------------------------------------------
--同步数据完成
PlayerAssembly = 
{
	m_iType = ProtocolId.PLAYER_ASSEMBLY,	m_iPlayerId = 0,
	m_iSvrId = 0,
}

function PlayerAssembly:clone()
	local inst_tbl = CopyTable(self);
	return inst_tbl;
end

function PlayerAssembly:marshal(oct)
	oct:PushUInt32(self.m_iPlayerId);
	oct:PushUInt32(self.m_iSvrId);
end

function PlayerAssembly:unmarshal(oct)
	self.m_iPlayerId = oct:PopUInt32();
	self.m_iSvrId = oct:PopUInt32();
end

