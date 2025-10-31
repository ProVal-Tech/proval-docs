import React from 'react';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import recentDocs from './recentDocs.json';
import styles from './recentDocuments.module.css';

type RecentDoc = {
    Title: string;
    Slug: string;
    LastCommit: string; // ISO or RFC date string
};

function isExternal(slug: string) {
    return /^https?:\/\//i.test(slug);
}

function getHref(slug: string) {
    if (isExternal(slug)) return slug;
    // Ensure docs/* path. Incoming slug typically starts with '/...'
    return `/docs${slug}`;
}

function formatRelative(dateStr: string): string {
    const d = new Date(dateStr);
    const now = new Date();
    const diffMs = now.getTime() - d.getTime();
    const sec = Math.floor(diffMs / 1000);
    const min = Math.floor(sec / 60);
    const hrs = Math.floor(min / 60);
    const days = Math.floor(hrs / 24);
    if (sec < 60) return 'just now';
    if (min < 60) return `${min} min ago`;
    if (hrs < 24) return `${hrs} hr${hrs === 1 ? '' : 's'} ago`;
    if (days < 7) return `${days} day${days === 1 ? '' : 's'} ago`;
    // Fallback: show date in locale short format
    return d.toLocaleDateString();
}

export default function ShowRecentDocs() {
    const [query, setQuery] = React.useState('');

    const filtered = React.useMemo(() => {
        const q = query.trim().toLowerCase();
        if (!q) return recentDocs as RecentDoc[];
        return (recentDocs as RecentDoc[]).filter((d) =>
            d.Title.toLowerCase().includes(q) || d.Slug.toLowerCase().includes(q)
        );
    }, [query]);

    return (
        <Layout title="Recent Documents" description="Recently edited documents">
            <main className={styles.page}>
                <div className="container">
                    <header className={styles.header}>
                        <div className={styles.headerTitleGroup}>
                            <h1 className={styles.title}>Recently Edited Documents</h1>
                            <p className={styles.subtitle}>
                                {filtered.length.toLocaleString()} item{filtered.length === 1 ? '' : 's'}
                            </p>
                        </div>
                        <div className={styles.searchWrap}>
                            <span className={styles.searchIcon} aria-hidden="true">
                                {/* magnifying glass icon */}
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
                                    <circle cx="11" cy="11" r="8"></circle>
                                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                </svg>
                            </span>
                            <input
                                type="search"
                                className={styles.search}
                                placeholder="Search by title or slug..."
                                value={query}
                                onChange={(e) => setQuery(e.target.value)}
                                aria-label="Search recent documents"
                            />
                        </div>
                    </header>

                    <div className={styles.grid}>
                        {(filtered as RecentDoc[]).map((doc, index) => {
                            const href = getHref(doc.Slug);
                            const external = isExternal(doc.Slug);
                            const lastEdited = new Date(doc.LastCommit);
                            const relative = formatRelative(doc.LastCommit);
                            const exact = lastEdited.toLocaleString();

                            const CardInner = (
                                <article className={styles.card}>
                                    <div className={styles.cardHeader}>
                                        <span className={styles.docIcon} aria-hidden="true">
                                            {/* document icon */}
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                                                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                                <polyline points="14 2 14 8 20 8"></polyline>
                                            </svg>
                                        </span>
                                        <h3 className={styles.cardTitle}>{doc.Title}</h3>
                                    </div>
                                    <div className={styles.cardMeta}>
                                        <span className={styles.badge} title={external ? 'External link' : 'Internal doc'}>
                                            {external ? 'External' : 'Doc'}
                                        </span>
                                        <span className={styles.metaSpacer} />
                                        <span className={styles.metaItem} title={exact}>
                                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" style={{ marginRight: 4 }}>
                                                <circle cx="12" cy="12" r="10"></circle>
                                                <polyline points="12 6 12 12 16 14"></polyline>
                                            </svg>
                                            {relative}
                                        </span>
                                    </div>
                                </article>
                            );

                            return external ? (
                                <a
                                    key={index}
                                    href={href}
                                    className={styles.cardLink}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                >
                                    {CardInner}
                                </a>
                            ) : (
                                <Link key={index} to={href} className={styles.cardLink}>
                                    {CardInner}
                                </Link>
                            );
                        })}
                    </div>

                    {filtered.length === 0 && (
                        <p className={styles.empty}>No documents match your search.</p>
                    )}
                </div>
            </main>
        </Layout>
    );
}