-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.3
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity hls_multiplier is
generic (
    C_S_AXI_CRTLS_ADDR_WIDTH : INTEGER := 6;
    C_S_AXI_CRTLS_DATA_WIDTH : INTEGER := 32 );
port (
    s_axi_CRTLS_AWVALID : IN STD_LOGIC;
    s_axi_CRTLS_AWREADY : OUT STD_LOGIC;
    s_axi_CRTLS_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CRTLS_ADDR_WIDTH-1 downto 0);
    s_axi_CRTLS_WVALID : IN STD_LOGIC;
    s_axi_CRTLS_WREADY : OUT STD_LOGIC;
    s_axi_CRTLS_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CRTLS_DATA_WIDTH-1 downto 0);
    s_axi_CRTLS_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CRTLS_DATA_WIDTH/8-1 downto 0);
    s_axi_CRTLS_ARVALID : IN STD_LOGIC;
    s_axi_CRTLS_ARREADY : OUT STD_LOGIC;
    s_axi_CRTLS_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CRTLS_ADDR_WIDTH-1 downto 0);
    s_axi_CRTLS_RVALID : OUT STD_LOGIC;
    s_axi_CRTLS_RREADY : IN STD_LOGIC;
    s_axi_CRTLS_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CRTLS_DATA_WIDTH-1 downto 0);
    s_axi_CRTLS_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_CRTLS_BVALID : OUT STD_LOGIC;
    s_axi_CRTLS_BREADY : IN STD_LOGIC;
    s_axi_CRTLS_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC );
end;


architecture behav of hls_multiplier is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "hls_multiplier,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.380000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=1,HLS_SYN_FF=112,HLS_SYN_LUT=168,HLS_VERSION=2018_3}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_logic_0 : STD_LOGIC := '0';

    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_ready : STD_LOGIC;
    signal a : STD_LOGIC_VECTOR (15 downto 0);
    signal b : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_rst_n_inv : STD_LOGIC;
    signal p_fu_42_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_fu_42_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_fu_42_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_fu_42_p00 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_fu_42_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_return : STD_LOGIC_VECTOR (31 downto 0);

    component hls_multiplier_mubkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (15 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component hls_multiplier_CRTLS_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC;
        ap_return : IN STD_LOGIC_VECTOR (31 downto 0);
        a : OUT STD_LOGIC_VECTOR (15 downto 0);
        b : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;



begin
    hls_multiplier_CRTLS_s_axi_U : component hls_multiplier_CRTLS_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CRTLS_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CRTLS_DATA_WIDTH)
    port map (
        AWVALID => s_axi_CRTLS_AWVALID,
        AWREADY => s_axi_CRTLS_AWREADY,
        AWADDR => s_axi_CRTLS_AWADDR,
        WVALID => s_axi_CRTLS_WVALID,
        WREADY => s_axi_CRTLS_WREADY,
        WDATA => s_axi_CRTLS_WDATA,
        WSTRB => s_axi_CRTLS_WSTRB,
        ARVALID => s_axi_CRTLS_ARVALID,
        ARREADY => s_axi_CRTLS_ARREADY,
        ARADDR => s_axi_CRTLS_ARADDR,
        RVALID => s_axi_CRTLS_RVALID,
        RREADY => s_axi_CRTLS_RREADY,
        RDATA => s_axi_CRTLS_RDATA,
        RRESP => s_axi_CRTLS_RRESP,
        BVALID => s_axi_CRTLS_BVALID,
        BREADY => s_axi_CRTLS_BREADY,
        BRESP => s_axi_CRTLS_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle,
        ap_return => p_fu_42_p2,
        a => a,
        b => b);

    hls_multiplier_mubkb_U1 : component hls_multiplier_mubkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        dout_WIDTH => 32)
    port map (
        din0 => p_fu_42_p0,
        din1 => p_fu_42_p1,
        dout => p_fu_42_p2);




    ap_done <= ap_start;
    ap_idle <= ap_const_logic_1;
    ap_ready <= ap_start;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    p_fu_42_p0 <= p_fu_42_p00(16 - 1 downto 0);
    p_fu_42_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(b),32));
    p_fu_42_p1 <= p_fu_42_p10(16 - 1 downto 0);
    p_fu_42_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(a),32));
end behav;