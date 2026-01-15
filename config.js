// =====================================================
// CONFIGURAÇÃO CENTRAL - SDR SOCIAL SELLING ASSISTANT
// =====================================================
// Este arquivo contém as credenciais do Supabase
// Todos os SDRs usam a mesma configuração
// =====================================================

const CONFIG = {
    // Supabase
    SUPABASE_URL: 'https://gjratnabemcaqaaymedh.supabase.co',
    SUPABASE_ANON_KEY: 'sb_publishable_omRb2tLG_qSFZobCER0jyg_P7ltTFFC',
    
    // Cloudflare Worker (Proxy para API Anthropic)
    PROXY_URL: 'https://black-wood-a129.ferramentas-ac3.workers.dev/',
    
    // Agent ID fixo (UUID) - seu agent_id existente
    DEFAULT_AGENT_ID: 'a819992e-b6a5-4ab8-82b3-78ca58d36f18'
};

// Não altere abaixo desta linha
if (typeof module !== 'undefined' && module.exports) {
    module.exports = CONFIG;
}
