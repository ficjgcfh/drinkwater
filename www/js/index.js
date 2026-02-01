// 喝水打卡应用
document.addEventListener('deviceready', onDeviceReady, false);

const STORAGE_KEY = 'drinkWaterRecords';
const DAILY_GOAL = 8;

function onDeviceReady() {
    console.log('Cordova is ready');
    initApp();
}

function initApp() {
    updateDate();
    updateStats();
    loadRecords();

    const checkInBtn = document.getElementById('checkInBtn');
    const clearBtn = document.getElementById('clearBtn');

    checkInBtn.addEventListener('click', handleCheckIn);
    clearBtn.addEventListener('click', handleClear);
}

function updateDate() {
    const dateElement = document.getElementById('currentDate');
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    const weekdays = ['日', '一', '二', '三', '四', '五', '六'];
    const weekday = weekdays[now.getDay()];

    dateElement.textContent = `${year}年${month}月${day}日 星期${weekday}`;
}

function getTodayString() {
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}

function getAllRecords() {
    const data = localStorage.getItem(STORAGE_KEY);
    return data ? JSON.parse(data) : [];
}

function saveRecord(record) {
    const records = getAllRecords();
    records.unshift(record);
    localStorage.setItem(STORAGE_KEY, JSON.stringify(records));
}

function getTodayRecords() {
    const today = getTodayString();
    const allRecords = getAllRecords();
    return allRecords.filter(record => record.date === today);
}

function updateStats() {
    const todayRecords = getTodayRecords();
    const allRecords = getAllRecords();

    document.getElementById('todayCount').textContent = todayRecords.length;
    document.getElementById('totalCount').textContent = allRecords.length;

    // 更新进度圆环
    const progress = Math.min(todayRecords.length, DAILY_GOAL);
    const percentage = progress / DAILY_GOAL;
    const circumference = 2 * Math.PI * 50;
    const offset = circumference * (1 - percentage);

    const progressCircle = document.getElementById('progressCircle');
    if (progressCircle) {
        progressCircle.style.strokeDashoffset = offset;
    }

    const progressText = document.getElementById('progressText');
    if (progressText) {
        progressText.textContent = `${progress}/${DAILY_GOAL}`;
    }
}

function loadRecords() {
    const todayRecords = getTodayRecords();
    const recordsList = document.getElementById('recordsList');

    if (todayRecords.length === 0) {
        recordsList.innerHTML = '<p class="no-records">还没有打卡记录，快来喝水吧！</p>';
        return;
    }

    let html = '';
    todayRecords.forEach((record, index) => {
        html += `
            <div class="record-item">
                <div class="record-icon">💧</div>
                <div class="record-info">
                    <div class="record-time">${record.time}</div>
                    <div class="record-date">${record.date}</div>
                </div>
                <div class="record-number">第${todayRecords.length - index}次</div>
            </div>
        `;
    });

    recordsList.innerHTML = html;
}

function handleCheckIn() {
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    const timeString = `${hours}:${minutes}:${seconds}`;

    const record = {
        date: getTodayString(),
        time: timeString,
        timestamp: now.getTime()
    };

    saveRecord(record);

    // 动画效果
    const btn = document.getElementById('checkInBtn');
    btn.classList.add('animate');
    setTimeout(() => {
        btn.classList.remove('animate');
    }, 300);

    updateStats();
    loadRecords();

    // 振动反馈
    if (typeof navigator.vibrate === 'function') {
        navigator.vibrate(100);
    }

    // 显示提示
    const todayCount = getTodayRecords().length;
    if (todayCount >= DAILY_GOAL) {
        showToast('🎉 恭喜！已完成今日目标！');
    } else {
        showToast('✅ 打卡成功！继续加油！');
    }
}

function handleClear() {
    if (confirm('确定要清空所有记录吗？此操作不可恢复！')) {
        localStorage.removeItem(STORAGE_KEY);
        updateStats();
        loadRecords();
        showToast('🗑️ 记录已清空');
    }
}

function showToast(message) {
    const toast = document.getElementById('toast');
    if (toast) {
        toast.textContent = message;
        toast.classList.add('show');
        setTimeout(() => {
            toast.classList.remove('show');
        }, 2000);
    }
}
