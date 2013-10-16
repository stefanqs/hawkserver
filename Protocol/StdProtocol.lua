-----------------------------------------------------------
--错误通知
ErrNotify = 
{
	m_iType = ProtocolId.ERR_NOTIFY,	m_iErrId = 0,
	m_iMode = 0,
}

function ErrNotify:clone()
	local inst_tbl = CopyTable(self);
	return inst_tbl;
end

function ErrNotify:marshal(oct)
	oct:PushUInt16(self.m_iErrId);
	oct:PushInt8(self.m_iMode);
end

function ErrNotify:unmarshal(oct)
	self.m_iErrId = oct:PopUInt16();
	self.m_iMode = oct:PopInt8();
end

-----------------------------------------------------------
--消息通知
MsgNotify = 
{
	m_iType = ProtocolId.MSG_NOTIFY,	m_sMsg = "",
	m_iMode = 0,
}

function MsgNotify:clone()
	local inst_tbl = CopyTable(self);
	return inst_tbl;
end

function MsgNotify:marshal(oct)
	oct:PushUString(self.m_sMsg);
	oct:PushInt8(self.m_iMode);
end

function MsgNotify:unmarshal(oct)
	self.m_sMsg = oct:PopUString();
	self.m_iMode = oct:PopInt8();
end

-----------------------------------------------------------
--时间同步
TimeSync = 
{
	m_iType = ProtocolId.TIME_SYNC,	m_iTime = 0,
}

function TimeSync:clone()
	local inst_tbl = CopyTable(self);
	return inst_tbl;
end

function TimeSync:marshal(oct)
	oct:PushUInt32(self.m_iTime);
end

function TimeSync:unmarshal(oct)
	self.m_iTime = oct:PopUInt32();
end

