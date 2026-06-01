import streamlit as st
import pandas as pd
import mysql.connector

st.set_page_config(
    page_title="NBA STATS",
    page_icon="🏀",
    layout="wide"
)

def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="nba_db"
    )

def consultar(sql, params=None):
    conn = conectar()
    df = pd.read_sql(sql, conn, params=params)
    conn.close()
    return df

def executar(sql, params=None):
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(sql, params)
    conn.commit()
    cursor.close()
    conn.close()

st.title("🏀 NBA STATS")

usuario = st.text_input("Usuário")
senha = st.text_input("Senha", type="password")

if usuario == "admin" and senha == "123":

    st.success("Login realizado com sucesso!")

    menu = st.sidebar.selectbox(
        "Menu",
        [
            "Home",
            "Times",
            "Jogadores",
            "Cadastrar Jogador",
            "Excluir Jogador"
        ]
    )

    if menu == "Home":

        total_times = consultar(
            "SELECT COUNT(*) AS total FROM times"
        )

        total_jogadores = consultar(
            "SELECT COUNT(*) AS total FROM jogadores"
        )

        col1, col2 = st.columns(2)

        col1.metric(
            "Times",
            int(total_times["total"][0])
        )

        col2.metric(
            "Jogadores",
            int(total_jogadores["total"][0])
        )

    elif menu == "Times":

        st.header("Times NBA")

        df_times = consultar("""
            SELECT
                id_time,
                nome,
                conferencia
            FROM times
            ORDER BY nome
        """)

        busca = st.text_input("Buscar time")

        if busca:

            df_times = df_times[
                df_times["nome"].str.contains(
                    busca,
                    case=False,
                    na=False
                )
            ]

        col1, col2 = st.columns(2)

        with col1:

            st.subheader("Leste")

            st.dataframe(
                df_times[
                    df_times["conferencia"] == "Leste"
                ],
                use_container_width=True
            )

        with col2:

            st.subheader("Oeste")

            st.dataframe(
                df_times[
                    df_times["conferencia"] == "Oeste"
                ],
                use_container_width=True
            )

    elif menu == "Jogadores":

        st.header("Jogadores")

        df_jogadores = consultar("""
            SELECT
                j.id_jogador,
                j.nome,
                j.idade,
                j.altura,
                j.posicao,
                t.nome AS time
            FROM jogadores j
            JOIN times t
            ON j.id_time = t.id_time
            ORDER BY j.nome
        """)

        busca = st.text_input("Buscar jogador")

        if busca:

            df_jogadores = df_jogadores[
                df_jogadores["nome"].str.contains(
                    busca,
                    case=False,
                    na=False
                )
            ]

        st.dataframe(
            df_jogadores,
            use_container_width=True
        )

    elif menu == "Cadastrar Jogador":

        st.header("Cadastrar jogador")

        df_times = consultar("""
            SELECT
                id_time,
                nome
            FROM times
            ORDER BY nome
        """)

        nome = st.text_input("Nome")

        idade = st.number_input(
            "Idade",
            min_value=15,
            max_value=60,
            step=1
        )

        altura = st.number_input(
            "Altura",
            min_value=1.50,
            max_value=2.50,
            step=0.01
        )

        posicao = st.selectbox(
            "Posição",
            [
                "Armador",
                "Ala-Armador",
                "Ala",
                "Ala-Pivô",
                "Pivô"
            ]
        )

        time_escolhido = st.selectbox(
            "Time",
            df_times["nome"]
        )

        id_time = df_times[
            df_times["nome"] == time_escolhido
        ]["id_time"].values[0]

        if st.button("Cadastrar jogador"):

            if nome.strip() == "":

                st.warning("Digite o nome do jogador.")

            else:

                existe = consultar(
                    """
                    SELECT id_jogador
                    FROM jogadores
                    WHERE nome = %s
                    """,
                    (nome,)
                )

                if not existe.empty:

                    st.warning(
                        "Esse jogador já está cadastrado."
                    )

                else:

                    try:

                        executar("""
                            INSERT INTO jogadores
                            (
                                nome,
                                idade,
                                altura,
                                posicao,
                                id_time
                            )
                            VALUES (%s, %s, %s, %s, %s)
                        """, (
                            nome.strip(),
                            idade,
                            altura,
                            posicao,
                            int(id_time)
                        ))

                        st.success(
                            "Jogador cadastrado com sucesso!"
                        )

                        st.rerun()

                    except:

                        st.warning(
                            "Erro ao cadastrar jogador."
                        )

    elif menu == "Excluir Jogador":

        st.header("Excluir jogador")

        df_jogadores = consultar("""
            SELECT
                id_jogador,
                nome
            FROM jogadores
            ORDER BY nome
        """)

        jogador_escolhido = st.selectbox(
            "Escolha o jogador",
            df_jogadores["nome"]
        )

        id_jogador = df_jogadores[
            df_jogadores["nome"] == jogador_escolhido
        ]["id_jogador"].values[0]

        st.warning(
            f"Você irá excluir: {jogador_escolhido}"
        )

        if st.button("Excluir jogador"):

            try:

                executar(
                    """
                    DELETE FROM jogadores
                    WHERE id_jogador = %s
                    """,
                    (int(id_jogador),)
                )

                st.success(
                    "Jogador excluído com sucesso!"
                )

                st.rerun()

            except:

                st.error(
                    "Não foi possível excluir."
                )

else:

    st.warning("Digite usuário e senha")