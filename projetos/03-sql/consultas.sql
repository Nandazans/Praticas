-- Projeto didático: análise de chamados de suporte
-- Todos os dados são fictícios.
-- Compatibilidade principal: SQLite.

DROP TABLE IF EXISTS chamados;
DROP TABLE IF EXISTS sistemas;

CREATE TABLE sistemas (
    sistema_id INTEGER PRIMARY KEY,
    nome_sistema TEXT NOT NULL
);

CREATE TABLE chamados (
    chamado_id INTEGER PRIMARY KEY,
    sistema_id INTEGER NOT NULL,
    categoria TEXT NOT NULL,
    prioridade TEXT NOT NULL,
    status TEXT NOT NULL,
    data_abertura TEXT NOT NULL,
    data_fechamento TEXT,
    FOREIGN KEY (sistema_id) REFERENCES sistemas(sistema_id)
);

INSERT INTO sistemas (sistema_id, nome_sistema) VALUES
(1, 'Portal de Atendimento'),
(2, 'Sistema Financeiro'),
(3, 'Aplicacao de Pagamentos');

INSERT INTO chamados
(chamado_id, sistema_id, categoria, prioridade, status, data_abertura, data_fechamento)
VALUES
(1001, 1, 'Acesso', 'Media', 'Resolvido', '2026-10-01 08:15:00', '2026-10-01 09:00:00'),
(1002, 2, 'Erro de consulta', 'Alta', 'Em atendimento', '2026-10-01 09:10:00', NULL),
(1003, 3, 'Transacao rejeitada', 'Alta', 'Escalado', '2026-10-01 09:30:00', NULL),
(1004, 1, 'Lentidao', 'Baixa', 'Resolvido', '2026-10-01 10:00:00', '2026-10-01 12:30:00'),
(1005, 2, 'Acesso', 'Media', 'Aberto', '2026-10-02 08:45:00', NULL),
(1006, 3, 'Falha de comunicacao', 'Alta', 'Resolvido', '2026-10-02 11:20:00', '2026-10-02 12:05:00'),
(1007, 1, 'Erro de consulta', 'Media', 'Em atendimento', '2026-10-03 14:00:00', NULL),
(1008, 3, 'Transacao rejeitada', 'Alta', 'Resolvido', '2026-10-03 15:10:00', '2026-10-03 15:40:00');

-- 1. Total de chamados por status.
SELECT status, COUNT(*) AS quantidade
FROM chamados
GROUP BY status
ORDER BY quantidade DESC;

-- 2. Chamados de alta prioridade.
SELECT chamado_id, categoria, status, data_abertura
FROM chamados
WHERE prioridade = 'Alta'
ORDER BY data_abertura;

-- 3. Quantidade de chamados por sistema.
SELECT s.nome_sistema, COUNT(c.chamado_id) AS total_chamados
FROM sistemas AS s
LEFT JOIN chamados AS c ON c.sistema_id = s.sistema_id
GROUP BY s.nome_sistema
ORDER BY total_chamados DESC;

-- 4. Tempo de resolução em minutos (SQLite).
SELECT
    chamado_id,
    ROUND((julianday(data_fechamento) - julianday(data_abertura)) * 1440, 1)
        AS minutos_para_resolver
FROM chamados
WHERE data_fechamento IS NOT NULL
ORDER BY minutos_para_resolver DESC;

-- 5. Chamados ainda não resolvidos.
SELECT chamado_id, categoria, prioridade, status, data_abertura
FROM chamados
WHERE status <> 'Resolvido'
ORDER BY
    CASE prioridade
        WHEN 'Alta' THEN 1
        WHEN 'Media' THEN 2
        ELSE 3
    END,
    data_abertura;
