package com.example.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegisterDAO {
	@Autowired
	private DataSource dataSource;

	public int registerOk(userInfoTO to) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;

		try {
			conn = dataSource.getConnection();

			String sql = "insert into novel_user_information values (?, ?, ?, ?, ?, now(), '회원')";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getUser_email());
			pstmt.setString(2, to.getUser_nickname());
			pstmt.setString(3, to.getUser_password());
			pstmt.setString(4, to.getUser_gender());
			pstmt.setString(5, to.getUser_birth());

			int result = pstmt.executeUpdate();
			if (result == 1) {
				flag = 0;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return flag;
	}

	// 카카오 회원가입
	public int kakaoregisterOk(userInfoTO to) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int result = 2;

		try {
			conn = dataSource.getConnection();

			String sql = "insert into novel_user_information values (?, ?, '0000', ?, ?, now(), '회원')";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getUser_email());
			pstmt.setString(2, to.getUser_nickname());
			pstmt.setString(3, to.getUser_gender());
			pstmt.setString(4, to.getUser_birth());

			result = pstmt.executeUpdate();
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return result;
	}
	
	
	// 아이디 중복체크
	public int IdCheck(String id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int result = 1;
		try {
			conn = dataSource.getConnection();

			String sql = "select count(user_email) user from novel_user_information where user_email = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt("user");
				// System.out.println("중복갯수 : "+result );
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return result;
	}

	// 닉네임 중복체크
	public int NicknameCheck(String nickname) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int result = 1;
		try {
			conn = dataSource.getConnection();

			String sql = "select count(user_nickname) user from novel_user_information where user_nickname = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt("user");
				// System.out.println("중복갯수 : "+result );
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return result;
	}

}
