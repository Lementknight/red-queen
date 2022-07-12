OPENQASM 2.0;
include "qelib1.inc";
gate rcccx_dg q0,q1,q2,q3 { u2(-2*pi,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(-2*pi,pi) q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; cx q0,q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; cx q0,q3; u2(-2*pi,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(-2*pi,pi) q3; }
gate rcccx q0,q1,q2,q3 { u2(0,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(0,pi) q3; cx q0,q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; cx q0,q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; u2(0,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(0,pi) q3; }
gate mcx q0,q1,q2,q3,q4 { h q4; cu1(pi/2) q3,q4; h q4; rcccx q0,q1,q2,q3; h q4; cu1(-pi/2) q3,q4; h q4; rcccx_dg q0,q1,q2,q3; c3sx q0,q1,q2,q4; }
gate oracle q0,q1,q2,q3,q4 { x q1; x q3; h q4; mcx q0,q1,q2,q3,q4; h q4; x q1; x q3; }
gate diffuser q0,q1,q2,q3,q4 { h q0; h q1; h q2; h q3; h q4; x q0; x q1; x q2; x q3; x q4; h q4; mcx q0,q1,q2,q3,q4; h q4; x q0; x q1; x q2; x q3; x q4; h q0; h q1; h q2; h q3; h q4; }
qreg q353[5];
creg c49[5];
h q353[0];
h q353[1];
h q353[2];
h q353[3];
h q353[4];
oracle q353[0],q353[1],q353[2],q353[3],q353[4];
diffuser q353[0],q353[1],q353[2],q353[3],q353[4];
oracle q353[0],q353[1],q353[2],q353[3],q353[4];
diffuser q353[0],q353[1],q353[2],q353[3],q353[4];
oracle q353[0],q353[1],q353[2],q353[3],q353[4];
diffuser q353[0],q353[1],q353[2],q353[3],q353[4];
oracle q353[0],q353[1],q353[2],q353[3],q353[4];
diffuser q353[0],q353[1],q353[2],q353[3],q353[4];
measure q353[0] -> c49[0];
measure q353[1] -> c49[1];
measure q353[2] -> c49[2];
measure q353[3] -> c49[3];
measure q353[4] -> c49[4];