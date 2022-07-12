OPENQASM 2.0;
include "qelib1.inc";
gate rcccx_dg q0,q1,q2,q3 { u2(-2*pi,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(-2*pi,pi) q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; cx q0,q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; cx q0,q3; u2(-2*pi,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(-2*pi,pi) q3; }
gate rcccx q0,q1,q2,q3 { u2(0,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(0,pi) q3; cx q0,q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; cx q0,q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; u2(0,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(0,pi) q3; }
gate mcx q0,q1,q2,q3,q4 { h q4; cu1(pi/2) q3,q4; h q4; rcccx q0,q1,q2,q3; h q4; cu1(-pi/2) q3,q4; h q4; rcccx_dg q0,q1,q2,q3; c3sx q0,q1,q2,q4; }
gate oracle q0,q1,q2,q3,q4 { x q0; x q1; h q4; mcx q0,q1,q2,q3,q4; h q4; x q0; x q1; }
gate diffuser q0,q1,q2,q3,q4 { h q0; h q1; h q2; h q3; h q4; x q0; x q1; x q2; x q3; x q4; h q4; mcx q0,q1,q2,q3,q4; h q4; x q0; x q1; x q2; x q3; x q4; h q0; h q1; h q2; h q3; h q4; }
qreg q416[5];
creg c56[5];
h q416[0];
h q416[1];
h q416[2];
h q416[3];
h q416[4];
oracle q416[0],q416[1],q416[2],q416[3],q416[4];
diffuser q416[0],q416[1],q416[2],q416[3],q416[4];
oracle q416[0],q416[1],q416[2],q416[3],q416[4];
diffuser q416[0],q416[1],q416[2],q416[3],q416[4];
oracle q416[0],q416[1],q416[2],q416[3],q416[4];
diffuser q416[0],q416[1],q416[2],q416[3],q416[4];
oracle q416[0],q416[1],q416[2],q416[3],q416[4];
diffuser q416[0],q416[1],q416[2],q416[3],q416[4];
measure q416[0] -> c56[0];
measure q416[1] -> c56[1];
measure q416[2] -> c56[2];
measure q416[3] -> c56[3];
measure q416[4] -> c56[4];